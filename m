From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 60991] New: Formula of CommitLimit is wrong
Date: Sun, 08 Sep 2013 16:37:51 +0000
Message-ID: <bug-60991-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60991

            Bug ID: 60991
           Summary: Formula of CommitLimit is wrong
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: sworddragon2-YDxpq3io04c@public.gmane.org
        Regression: No

The documentation on
https://www.kernel.org/doc/Documentation/filesystems/proc.txt says: "The
CommitLimit is calculated with the following formula:
              CommitLimit = ('vm.overcommit_ratio' * Physical RAM) + Swap"

Variables on my system:
vm.overcommit_ratio = 50
Physical RAM = 16 GiB
SwapTotal = 16776188 KiB

/proc/meminfo says "CommitLimit:    24993316 kB". Now lets see if this is
correct: CommitLimit = (50 * 16777216 KiB) + 16776188 KiB; CommitLimit =
855636988 KiB. The result from the formula does not match with the value
reported by the kernel.

It is more likely that 'vm.overcommit_ratio' must be devided by 100 and
"Physical RAM" must be replaced by the available memory (reported on my system
as "MemTotal:       16434260 kB"). The new formula looks this: CommitLimit =
('vm.overcommit_ratio' / 100 * 'MemTotal') + 'SwapTotal'. The result will be:
CommitLimit = (50 / 100 * 16434260 KiB) + 16776188 KiB; CommitLimit = 24993318
KiB. There is a difference of 2 KiB to the reported value but maybe this comes
from internal rounding.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
