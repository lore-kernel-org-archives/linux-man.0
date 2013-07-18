From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 60575] New: Please mention build dependency on "bc"
Date: Thu, 18 Jul 2013 06:12:10 +0000
Message-ID: <bug-60575-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60575

            Bug ID: 60575
           Summary: Please mention build dependency on "bc"
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: bugzilla.kernel.bpeb-o6iJJGtClBpGEOBiBlW9YYQuADTiUCJX@public.gmane.org
                CC: hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org
        Regression: Yes

Hi there,

test-compiling 3.10 resulted in an error in my build chroot. The
easily identifiable reason was that a while ago, an additional build
dependency on the "bc" was added. This obviously happened in

commit 70730bca1331fc50c3caacaea00439de1325bd6e
Author: H. Peter Anvin <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Date:   Thu Feb 14 15:13:55 2013 -0800

    kernel: Replace timeconst.pl with a bc script

However, the "Kernel compilation" section Documentation/Changes was
not updated accordingly and, I am asking you to change this.

In my opinion, the documentation should mention that. At least on
Debian, the bc package is not necessarily installed - unlike for
example the coreutils that are also needed to build the kernel without
being mentioned in that document.

Cheers,
    Christoph

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
