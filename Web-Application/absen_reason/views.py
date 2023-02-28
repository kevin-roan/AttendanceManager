from django.shortcuts import render
from absen_reason.models import AbsentReason
from class_reg.models import Class
from absen_reason.srialzer import android_serializr
from django.http import HttpResponse,HttpResponseRedirect
from student.models import Student
from rest_framework.views import Response,APIView
from attendance.models import Attendence
from django.db.models import Q
# Create your views here.

from Attendance_prediction import settings
from pandas import read_excel

from sklearn import svm


def predict(request):
    obj = Class.objects.all()

    b = AbsentReason.objects.all()
    contexxt = {
        'objval':obj,
        'ob':b,
    }
    if request.method == 'POST':
        s = request.POST.get('s')
        c = request.POST.get('c')
        print(s)
        print(c)

        b = AbsentReason.objects.filter(sem=s,c_id=c)
        print(len(b))
        le = len(b)
        if le > 0:
            le = ""
        else:
            le = "No attendanace data found "
        context = {
            'ob': b,
            'objval': obj,
            'le':le
        }
        return render(request, 'absent_reason/hod_predictreason.html', context)
    return render(request,'absent_reason/hod_predictreason.html',contexxt)


class absent_view(APIView):
    def get(self,request):
        ob = AbsentReason.objects.all()
        ser = android_serializr(ob,many=True)
        return Response(ser.data)
    def post(self,request):


        ob = Student.objects.get(s_id=request.data['s'])

        obj = AbsentReason()
        obj.s_id = request.data['s']
        obj.c_id = ob.c_id
        obj.a_id = request.data['a']
        obj.sem = ob.sem
        obj.date = request.data['date']
        obj.reason = request.data['reason']
        obj.save()
        return HttpResponse('Posting')


def pre(request,idd):
    obj = AbsentReason.objects.get(ab_id=idd)
    sem = obj.sem
    cid = obj.c_id
    print(obj.s_id)
    print(obj.a.s_id)

    # -----------------------------------

    # select absent hours of std
    obb = Attendence.objects.filter(sem=sem, c_id=cid, date=obj.a.date, s_id=obj.s_id)

    # current std data
    ob = Attendence.objects.filter(sem=sem,c_id=cid,date=obj.a.date,s_id=obj.s_id).values_list('h1','h2','h3','h4','h5')
    print(len(ob))
    # print(ob)
    # print(type(ob))
    print(list(ob))

    # other std data
    ob2 = Attendence.objects.filter(sem=sem,c_id=cid,date=obj.a.date).values_list('h1','h2','h3','h4','h5').exclude(s_id=obj.s_id)
    # print(ob2)
    # print(type(ob2))
    print(list(ob2))

    def removeElements(A, B):
        for i in range(len(B) - len(A) + 1):
            for j in range(len(A)):
                if B[i + j] != A[j]:
                    break
            else:
                return True
        return False

    # Driver code
    A = list(ob)
    B = list(ob2)


    l = A + B
    print(l)

    co = l.count(A[0])
    print(co)

    print(removeElements(A, B))

    res = removeElements(A, B)

    # same hour absent
    sh = ""
    sss = ""
    if res == True:
        print("yes")
        sh = "Yes"
        sss = 1
    else:
        print("nooo")
        sh = "No"
        sss = 0
    # ---------------------------------------------

    # select same user that absent in same day
    ob1 = Attendence.objects.filter((Q(sem=sem) & Q(c_id=cid) & Q(date=obj.a.date)) &
                                    (Q(h1='A') | Q(h2='A') | Q(h3='A') | Q(h4='A') | Q(h5='A'))).exclude(s_id=obj.s_id)
    print(len(ob1))
    print(ob1)

    inp = "1" + "#" + str(len(ob1)) + "#" + str(sss) + "#" + str(co)
    inpa = inp.split('#')
    print(inpa)
    print(len(inpa))

    dspath = settings.BASE_DIR + settings.STATIC_URL + "data.xlsx"
    data = read_excel(dspath, "Sheet1")

    X = data.iloc[:, 0:4].values
    y = data.iloc[:, 4].values

    print('Training')

    clf = svm.SVC()
    clf.fit(X, y)

    o = clf.predict([inpa])

    pr = o[0]

    print(pr)

    if str(pr) == '1':
        pr = 'Reason cant be genuine, Check history'
    elif str(pr) == '0':
        pr = 'Reason is Genuine'
    else:
        pr = 'Try again...'
    print(pr)

    context ={
        'ob':obj,
        'ab':len(ob1),
        'att':ob1,
        'sm':sh,
        'co':co,
        'res':pr
    }


    return render(request,'absent_reason/predict.html',context)


def delete(request,idd):
    obj = AbsentReason.objects.get(ab_id=idd)
    obj.delete()
    return HttpResponseRedirect('/absent/predict/')
