From: Chris Delozier <c.s.delozier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: posix_fadvise(2) typo
Date: Fri, 6 Mar 2015 20:08:49 -0500
Message-ID: <CAPRyNvqVXd9+hn2=-x0DYDyP4rxiGHP9mN4EKjxNt+jXhHeBew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://man7.org/linux/man-pages/man2/posix_fadvise.2.html

Section: Notes

Subsection: Architecture-specific variants

Sentence: "Therefore, these architectures define a version of the
system call that orders the arguments suitably, but otherwise is
otherwise exactly the same as posix_fadvise()."

Suggestion: "Therefore, these architectures define a version of the
system call that orders the arguments suitably, but is otherwise
exactly the same as posix_fadvise()."


-- 
Chris Delozier
c.s.delozier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
