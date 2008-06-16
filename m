From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: PR_SET_SECCOMP and PR_GET_SECCOMP doc (and bug?)
Date: Mon, 16 Jun 2008 14:15:13 +0200
Message-ID: <48565951.40603@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andrea-Vyt77T80VFVWk0Htik3J/w@public.gmane.org
Cc: Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Andrea,

Below is my attempt to document the SECCOMP prctl() operations that you added
in 2.6.23.  Could you please read, and let me know if I have the details
correct.  Especially take a look at the description of PR_GET_SECCOMP, whose
operation tends to suggest a thinko:

    PR_SET_SECCOMP (since Linux 2.6.23)
        Set the secure computing mode for the calling  thread.   In
        the  current  implementation,  arg2  must  be 1.  After the
        secure computing mode has been set to 1,  the  only  system
        calls  that  the  thread  is permitted to make are read(2),
        write(2), _exit(2), and sigreturn(2).  Other  system  calls
        result in the delivery of a SIGKILL signal.  Secure comput-
        ing mode is useful for number-crunching  applications  that
        may  need  to execute untrusted byte code, perhaps obtained
        by reading from a pipe or socket.  This operation  is  only
        available  if  the kernel is configured with CONFIG_SECCOMP
        enabled.

    PR_GET_SECCOMP (since Linux 2.6.23)
        Return the secure computing mode  of  the  calling  thread.
        Not  very  useful: if the caller is not in secure computing
        mode, this operation returns 0; if the caller is in  secure
        computing  mode, then the prctl() call will cause a SIGKILL
        signal to be sent to the process.  This operation  is  only
        available  if  the kernel is configured with CONFIG_SECCOMP
        enabled.

Have I misunderstood something?  Surely it is not really intended that
PR_GET_SECCOMP be this useless?  The alternatives that I can think of would be
that

a) at least the call prctl(PR_GET_SECCOMP) would be among the set of permitted
syscalls in secure computing mode, or

b) there shouldn't be a prctl(PR_GET_SECCOMP) at all.

Cheers,

Michael

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
