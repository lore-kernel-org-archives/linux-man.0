From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: patchset for fgetgrent fgetpwent getspnam mallinfo sigpause and
 termios
Date: Sat, 12 Sep 2015 15:00:05 +0800
Message-ID: <1442041205.10612.3.camel@G08FNSTD140232>
References: <1440411596-2566-1-git-send-email-zenglg.jy@cn.fujitsu.com>
	 <1441094443.341.0.camel@G08FNSTD140232>
	 <1441776711.22425.6.camel@G08FNSTD140232> <55F2A8B1.9070808@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55F2A8B1.9070808-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

On Fri, 2015-09-11 at 12:10 +0200, Michael Kerrisk (man-pages) wrote:
> On 09/09/2015 07:31 AM, Zeng Linggang wrote:
> > Hello,
> > 
> > Could someone help to review these?
> > I think these codes is not really too much if you have scanned them.
> > Please keep a little patience. :)
> 
> My apologies for the delay, Zeng Linggang. I'm a little too busy
> at the moment.
> 

That's OK.
And thank you very much.

Best regards,
Zeng

> Cheers,
> 
> Michael
> 
> 
> > Thanks and best regards,
> > Zeng
> > 
> > On Tue, 2015-09-01 at 16:00 +0800, Zeng Linggang wrote:
> >> Hello,
> >>
> >> Ping! :)
> >>
> >> Thanks and best regards,
> >> Zeng
> >>
> >> On Mon, 2015-08-24 at 18:19 +0800, Zeng Linggang wrote:
> >>> Hello,
> >>>
> >>> This patchset is for fgetgrent.3, fgetpwent.3, sigpause.3, termios.3,
> >>> getspnam.3 and mallinfo.3
> >>>
> >>> 1. fgetgrent.3 and fgetpwent.3:
> >>>    We have some discussions about these two functions, the Subject:
> >>>    "Re: question about markings of fgetgrent and fgetpwent"
> >>>    However, something about the copyright impeded the progress.
> >>>    I am sorry for that, if you are OK, please see these two patches below,
> >>>    I have added some "FIXME:" descriptions in them.
> >>>
> >>> 2. getspnam.3
> >>>    getspnam.3 is a little like fgetgrent.3 and fgetpwent.3, but there are not
> >>>    markings in glibc document. I use the function names for the identifiers like
> >>>    fgetgrent.3 and fgetpwent.3.
> >>>
> >>> 3. mallinfo.3
> >>>    Hope the descriptions about "const:mallopt" could explain clearly enough in
> >>>    the patch.
> >>>
> >>> 4. sigpause.3 and termios.3
> >>>    These two functions are safety in Linux kernel, the markings in glibc manual
> >>>    are more detailed. I also have added some "FIXME:" descriptions in them.
> >>>
> >>>
> >>> Thanks and best regards,
> >>> Zeng
> >>> --
> >>> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> >>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >>
> >>
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> >> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> > 
> > 
> 
> 


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
