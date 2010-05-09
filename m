From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 15952] New: man page cmsg(3) inconsistency
Date: Sun, 9 May 2010 22:56:06 GMT
Message-ID: <bug-15952-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=15952

               URL: http://bugs.gentoo.org/show_bug.cgi?id=318801
           Summary: man page cmsg(3) inconsistency
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
        ReportedBy: chris2k01-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
        Regression: No


In man page cmsg(3), I see the following prose:

"Finally, the msg_controllen field of the msghdr should be set to the sum of
the CMSG_SPACE() of the length of all control messages in the buffer. For more 
information on the msghdr, see recvmsg(2)."

Then, in the sample code at the bottom, I see this code:
           msg.msg_control = buf;
           msg.msg_controllen = sizeof buf;
           cmsg = CMSG_FIRSTHDR(&msg);
           cmsg->cmsg_level = SOL_SOCKET;
           cmsg->cmsg_type = SCM_RIGHTS;
           cmsg->cmsg_len = CMSG_LEN(sizeof(int) * NUM_FD);
           /* Initialize the payload: */
           fdptr = (int *) CMSG_DATA(cmsg);
           memcpy(fdptr, myfds, NUM_FD * sizeof(int));
           /* Sum of the length of all control messages in the buffer: */
           msg.msg_controllen = cmsg->cmsg_len;

This is inconsistent: the prose states that msg_controllen should be
initialized with the sum of CMSG_SPACE across all messages, whereas the example
code shows msg_controllen being initialized with cmsg->cmsg_len, which is
itself initialized with CMSG_LEN, not CMSG_SPACE.

I don't know what the right answer is, but for control messages whose length is
not a multiple of the alignment requirement, this could make a difference.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
