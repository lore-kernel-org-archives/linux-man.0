From: Alexei Starovoitov <alexei.starovoitov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] seccomp.2: Note that memory area is read-only
Date: Sat, 18 Apr 2015 17:29:43 -0700
Message-ID: <20150419002942.GA733@Alexeis-MBP.westell.com>
References: <5522A66F.9060606@gmail.com>
 <CAGXu5jLriPDQR=BDDe7ztVua+-0wLDd-vsFZt5eu18ThYN69nA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGXu5jLriPDQR=BDDe7ztVua+-0wLDd-vsFZt5eu18ThYN69nA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, Apr 18, 2015 at 04:37:35PM -0700, Kees Cook wrote:
> On Mon, Apr 6, 2015 at 8:29 AM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hi Kees,
> >
> > I recently was asked about the point below, and had to go check the code
> > to be sure, since the man page said nothing. It would be good to have
> > a confirmation: the seccomp_data buffer supplied to a seccomp BPF program
> > is read-only, right? (That is, one can't write to the buffer in order to
> > change the arguments that a system call actually receives.)
> 
> That's correct. If BPF even allows changing the data, it's not copied
> back to the syscall when it runs. Anything wanting to do things like
> that would need to use ptrace to catch the call an directly modify the
> registers before continuing with the call.

Today BPF programs can only read from seccomp_data buffer.
I think it would be an interesting feature to allow overwrite of
syscall arguments by the program on the fly... sometime in the future.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
