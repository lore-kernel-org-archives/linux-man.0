From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 106281] New: proc(5) is missing MemAvailable documentation for
 /proc/meminfo
Date: Mon, 19 Oct 2015 18:56:35 +0000
Message-ID: <bug-106281-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=106281

            Bug ID: 106281
           Summary: proc(5) is missing MemAvailable documentation for
                    /proc/meminfo
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org
        Regression: No

The following fields are undocumented in the proc(5) manual page:

DirectMap2M
DirectMap4k
MemAvailable

(noticed because MemAvailable was missing, the others were found using:)
cut -d: -f1 /proc/meminfo > proc.meminfo;
man proc| awk 'p&&/^ *\/proc\/modules/{exit}
 p&&/%/{print $1} /meminfo$/{p=1}' > proc.5;
grep -H . proc.5 proc.meminfo | tr : ' ' | sort -k2 | uniq -u -f 1 | sort;


This documentation issue exists in man-pages 4.02, but the current git repo is
also missing these fields. MemAvailable is briefly described in free(1) though
(from procps-ng 3.3.11). It is still missing details, how does it interact with
swap, virtio ballooning, tmpfs, etc.?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
