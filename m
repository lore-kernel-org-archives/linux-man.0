From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 27052] New: man sched_rr_get_interval says the interval depend
 on nice, but it's incorrect.
Date: Wed, 19 Jan 2011 05:04:49 GMT
Message-ID: <bug-27052-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=27052

           Summary: man sched_rr_get_interval says the interval depend on
                    nice, but it's incorrect.
           Product: Documentation
           Version: unspecified
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org
        Regression: No


man sched_rr_get_interval says SCHED_RR quantum depend on nice value.

----------------------------------------------------------------------------------
   Linux Notes
       POSIX  does  not  specify  any  mechanism  for controlling the size of
the
       round-robin time quantum.  However, Linux provides a (non-portable)
method
       of  doing  this.  The quantum can be controlled by adjusting the
process's
       nice value (see setpriority(2)).  Assigning a negative (i.e.,  high) 
nice
       value  results  in a longer quantum; assigning a positive (i.e., low)
nice
       value results in a shorter quantum.  The default quantum is  0.1 
seconds;
       the degree to which changing the nice value affects the quantum has
varied
       somewhat across kernel versions.
----------------------------------------------------------------------------------

But current code doesn't depent on it. it always use 0.1 seconds.
Hehe, The code comments is misleading too. It's not knob. ;)

----------------------------------------------------------------------------------
/*
 * These are the 'tuning knobs' of the scheduler:
 *
 * default timeslice is 100 msecs (used only for SCHED_RR tasks).
 * Timeslices get refilled after they expire.
 */
#define DEF_TIMESLICE           (100 * HZ / 1000)

(snip)

static void task_tick_rt(struct rq *rq, struct task_struct *p, int queued)
{
        update_curr_rt(rq);

        watchdog(rq, p);

        /*
         * RR tasks need a special form of timeslice management.
         * FIFO tasks have no timeslices.
         */
        if (p->policy != SCHED_RR)
                return;

        if (--p->rt.time_slice)
                return;

        p->rt.time_slice = DEF_TIMESLICE;

        /*
         * Requeue to the end of queue if we are not the only element
         * on the queue:
         */
        if (p->rt.run_list.prev != p->rt.run_list.next) {
                requeue_task_rt(rq, p, 0);
                set_tsk_need_resched(p);
        }
}

(snip)

static unsigned int get_rr_interval_rt(struct rq *rq, struct task_struct *task)
{
        /*
         * Time slice is 0 for SCHED_FIFO tasks
         */
        if (task->policy == SCHED_RR)
                return DEF_TIMESLICE;
        else
                return 0;
}

----------------------------------------------------------------------------------

I think the man page only describe O(1) scheduler.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
