using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService" in both code and config file together.
[ServiceContract]
public interface IService
{
    [OperationContract]
    void KFspAddConNum(string fname, string lname, int eventID, int connum);
    [OperationContract]
    void KFspAddExistingPersontoContestant(string fname, string lname, int eventID);
    [OperationContract]
    void KFspAddPersonToContestant(string fname, string lname, int eventID);
    [OperationContract]
    DataTable KFspCheckConExistance(string fname, string lname, int eventID);
    [OperationContract]
    DataTable KFspCheckconnameavailability(string fname, string lname);
    [OperationContract]
    DataTable KFspCheckEventAccount(string epname, string euname);
    [OperationContract]
    DataTable KFspCheckEventName(string ename);
    [OperationContract]
    DataTable KFspCheckEventPerson(string efname, string elname);
    [OperationContract]
    void KFspCreateEvent(string efname, string elname, string epname, string ename, string euname);
    [OperationContract]
    void KFspFinalizeEvent(string eventid);
    [OperationContract]
    void KFspPopulateScores(string confname, string conlname, string judgefname, string judgelname, string judgeuname, string judgepass, int eventid, string critname);

}
