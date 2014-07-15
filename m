From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 80311] New: Man page for /etc/hosts is inadequate
Date: Tue, 15 Jul 2014 21:17:42 +0000
Message-ID: <bug-80311-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=80311

            Bug ID: 80311
           Summary: Man page for /etc/hosts is inadequate
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: root-X6/7+m0v+V3YtjvyW6yDsg@public.gmane.org
        Regression: No

I am editing a /etc/hosts file and hence reading the man page.  I have noticed
two issues.


1: I wish to associate at least two host names with one IP number.
(killmartha.com and worik.org to start with).  It is not clear in the man page
if I should use two lines:

              IP_address1 hostname1
              IP_address1 hostname2

or 

              IP_address1 hostname1 hostname2

In the second case hostname2 would be an alias for hostname1.  From reading the
man page I am guessing I use two lines but it is not clear.

2: canonical_hostname is not defined in the document.  (I am fairly sure I know
what it is but it should be defined in the document that uses it) and alias is
defined but it is not clear from the definition if it can be used in the one
line case above.

I am confident I can sort this out for myself.  If so I can write what I think
should be added to the man page if any one agrees with me that this is a
problem.

Worik

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
