import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff93bffe),
        title: const Text(
          "Privacy Policy",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            child: Column(
              children: [
                Text(
                  "Daily plan, track and finish your to-do task lists whether they be simple grocery shopping lists, daily habits tied to goals, single work tasks or complex multi-person projects. Todo is an easy-to-use productivity app that was featured as a Life Hack & Macworld says, “…oozes with awesomeness.” Winner of the “Best Productivity App for iPad” and listed among the “Top Ten Paid Productivity Apps...” this app is a daily companion for productivity people. Refined over 10 years of constant perfecting, Todo is an all-encompassing productivity system helping millions of users to: • Improve time efficiency • Remember important details • Deliver results on time • Increase quality & consistency • Become more reliable • Be more productive • Build healthy habits and achieve goals • Change behavior Simple to customize and fun to use, Todo has everything you’d expect in a productivity system including: • START & END DATES - Measure the start, duration and forecasted finish dates. • TASK NOTES & COMMENTS - Add important notes. Comments are tracked by day and person. • TASK ACTIONS – Associate any task with a person in your address book, a URL or a phone number so you can take quick action when it is time to get work done. Build a smart list to see all tasks with actions related to people. • MULTIPLE REMINDERS – Want a nudge 1 month, 1 week, 1 day and 1 hour before a task is due. Go ahead and be our guest with multiple ways to get to results. But beware of alert fatigue. • RECURRING TASKS – Set a task to repeat when you need it with the recurrence based on the due date or completion date. If you want to be reminded to take the trash out every Thursday without fail, then choose recurrence based on the due date. If you want a daily recurring reminder to send a thank you note to someone else every few days, choose the recurrence based on the completion date and you'll have the flexibility to send that note when it is convenient. • LOCATION REMINDERS – Need to remember to buy an item or complete a task when you arrive at a certain location? No problem. Drop a pin on that location and Todo will alert you with the task details when you get there. • EMAIL TASK CREATION – Log in to the Todo web client, select settings and copy your custom email address. Then email yourself tasks that are dropped into your Todo inbox or you can log in to your settings to customize the default location for new tasks. • SECURE CLOUD SYNC – The Todo sync reliably backs up your data to our secure cloud seamlessly making it available whether you are working on Mac, Web, iOS or two others. • SMART LISTS – Create custom lists using filters that organize tasks by any data element in Todo. Want to see tasks due 4 weeks and beyond? Want to see tasks assigned to a person? Want to see tasks tagged with a specific word? You can do that and more. Push everything into Todo with the power to search, organize and track tasks just the way you want. • CALENDAR VIEW – From any list view, click the calendar icon to see a monthly view of tasks organized by due dates. Want to quickly change any task due date? Drag and drop the task to the new calendar date and your due date is changed. • FOCUS LISTS – Quickly see all your tasks due today or in the past. • SIRI VOICE TO TEXT – Use Siri voice commands to capture tasks on the go. Search the Todo help file for more instructions. • SHARE LISTS – Invite others to view and contribute to tasks.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}