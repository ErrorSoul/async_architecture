# Актор, Команда, Событие, Query

##### Таск-трекер должен быть  доступен всем сотрудникам компании.
*   Actor — Account

*   Command — Login to task-tracker

*   Data — ???

*   Event — **Account.Logined**
#####  Create new Task
*   Actor — Account
*   Command — Create new task

*   Data — Task + Account Public ID

*   Event — **Task.Created**
#####  Assign Task 
*   Actor — "**Task.Created**" event
*   Command — Assign task 

*   Data — Task + Account Public ID

*   Event — **Task.Assigned**
#####  Reassign Task 
*   Actor — Account with role (admin || manager)
*   Command — Reassign task 

*   Data — Task + *Random* Account Public ID

*   Event — **Task.Assigned**

#####  Complete Task
*   Actor — Account
*   Command — Complete Task

*   Data — Task + Account Public ID

*   Event — **Task.Completed**
#####  Update today max price
*    Actor — "**Task.Completed**" event
*   Command — Update max price

*   Data — completed task price 
*   Event — **MaxPrice.Updated**
#####  Pay 
*   Actor — "**Task.Completed**" event
*   Command — Pay for task

*   Data — Balance + task

*   Event — **Balance.Deposited**
##### Withdraw
*   Actor — "**Task.Assigned**" event
*   Command — assign withdraw

*   Data — Balance + task

*   Event — **Balance.Withdrew**
##### Send Zero Balance
*   Actor — Accounting
*   Command — Send notification about zero balance

*   Data — balance + public Account ID

*   Event — **Balance.ZeroBalanceSent**

##### Create audit record 
*   Actor — ("**Balance.Deposited**"|| "**Balance.Withdrew**") event
*   Command — Create audit record

*   Data — Balance + Public Account ID

*   Event — ???
##### Send Salary
*   Actor — Accounting
*   Command — Send daily salary

*   Data — amount + balance + public Account ID

*   Event — **Balance.Sent**
##### Send Salary Email
*   Actor — Accounting
*   Command — Send salary email

*   Data — amount + balance + public Account ID

*   Event — **Balance.EmailSent**
##### Create audit record 
*   Actor — "**Balance.Sent**" event
*   Command — Create audit record

*   Data — Balance + Public Account ID

*   Event — ???

 




 