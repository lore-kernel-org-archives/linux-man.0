From: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] New page describing userfaultfd(2) system call.
Date: Tue, 27 Dec 2016 12:20:38 +0100
Message-ID: <20161227112038.GD16976@redhat.com>
References: <1482307713-21853-1-git-send-email-rppt@linux.vnet.ibm.com>
 <CAKgNAkgb=qfTZA4fzUGVmLis-bK5kFU0PfYwHs4dhz+1RRa2TQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkgb=qfTZA4fzUGVmLis-bK5kFU0PfYwHs4dhz+1RRa2TQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello,

On Tue, Dec 27, 2016 at 09:16:25AM +0100, Michael Kerrisk (man-pages) wrote:
> Hi Mike,
> 
> Thanks for working on this page. Just for background (since it helps
> me fore review), how did you get the info that is documented in the
> page?

Mike maintained and contributed to the non-cooperative support of
userfaultfd (not documented yet in the manpage because not upstream
yet) and he also wrote from scratch the shmem support of userfaultfd
(also still queued for upstream merging). So I assume all information
in the manpage has been obtained by reading the kernel code of
userfaultfd.

Thanks,
Andrea
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
