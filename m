From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 68861] New: Man page strftime Confusingly Refers to Weekday
 Rather than Day of Week
Date: Thu, 16 Jan 2014 23:09:09 +0000
Message-ID: <bug-68861-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=68861

            Bug ID: 68861
           Summary: Man page strftime Confusingly Refers to Weekday Rather
                    than Day of Week
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: bedens-lndS8KVcD7rQT0dZR+AlfA@public.gmane.org
        Regression: No

In several parts of the strftime page there are references to weekday which in
several human cultures / locales specifies the set of the days of the week that
are distinct from the set that represent the weekend.

To mitigate confusion, we propose that the man page text be modified so that
the "weekday" text is changed to "day of week".

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
