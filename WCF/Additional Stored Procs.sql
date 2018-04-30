CREATE Procedure [dbo].[spViewJudgeUsingJudgeID]
(
	@JudgeID						int

)
as
Begin
	Begin TRY
		Begin Transaction
		
		select e.EventID,e.EventName 
		from judge as j 
		left join EventJudges as ej on ej.JudgeID=j.JudgeID 
		left join [Event] as e on e.EventID = ej.EventID
		where J.JudgeID = @JudgeID

		Commit Transaction
	End try


	Begin Catch
		Rollback Transaction
		Select ERROR_MESSAGE() as 'Return_Value';
	End Catch
End