From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: posix_fadvise(2) typo
Date: Sun, 08 Mar 2015 09:09:26 +0100
Message-ID: <54FC03B6.3030807@gmail.com>
References: <CAPRyNvqVXd9+hn2=-x0DYDyP4rxiGHP9mN4EKjxNt+jXhHeBew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPRyNvqVXd9+hn2=-x0DYDyP4rxiGHP9mN4EKjxNt+jXhHeBew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Delozier <c.s.delozier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/07/2015 02:08 AM, Chris Delozier wrote:
> http://man7.org/linux/man-pages/man2/posix_fadvise.2.html
> 
> Section: Notes
> 
> Subsection: Architecture-specific variants
> 
> Sentence: "Therefore, these architectures define a version of the
> system call that orders the arguments suitably, but otherwise is
> otherwise exactly the same as posix_fadvise()."
> 
> Suggestion: "Therefore, these architectures define a version of the
> system call that orders the arguments suitably, but is otherwise
> exactly the same as posix_fadvise()."

Thanks, Chris. Fixed.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
