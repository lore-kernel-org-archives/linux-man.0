From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] fexecve.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 15 Jun 2015 11:58:30 +0800
Message-ID: <1434340710.31762.26.camel@G08FNSTD140232>
References: <1432721584-11342-1-git-send-email-zenglg.jy@cn.fujitsu.com>
	 <CAJYzjmf22=VTKOd1Fk-o_vAATp4RRZSoohh-uDdpQHh9UWBdXA@mail.gmail.com>
	 <557B2C8D.3030401@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <557B2C8D.3030401-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Samuel Bronson <naesten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

On Fri, 2015-06-12 at 21:01 +0200, Michael Kerrisk (man-pages) wrote:
> Hi Zeng Linggang,
> 
> On 05/27/2015 05:42 PM, Samuel Bronson wrote:
> > On Wed, May 27, 2015 at 6:12 AM, Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
> >> After research, We think fexecve() is thread-safe. But, there
> >> is not marking of fexecve() in glibc document.
> > 
> > Um, fexecve() is just like execve(), only on a file descriptor.  (In
> > fact, it appears to be implemented using execve() on
> > /proc/self/fd/$FD.)
> > 
> > As such, the following point from execve(2) applies:
> > 
> >        *  All threads other than the calling thread are  destroyed  during  an
> >           execve().   Mutexes, condition variables, and other pthreads objects
> >           are not preserved.
> > 
> > This does not seem to correspond with the usual notion of "thread
> > safe", though I guess it would be technically safe to, say, have
> > several threads racing to run fexecve(). Further text is probably
> > warranted here.
> 
> Did you have any thoughts on Samuel's point?

Thanks for your remind, I almost miss it.

As we can see, the detail information has been list in 'execve'. I think
it is not necessary to add further text.

Best regards,
Zeng

> 
> Cheers,
> 
> Michael
> 
> 
> 


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
