From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: patchset for fgetgrent fgetpwent getspnam mallinfo sigpause and
 termios
Date: Tue, 1 Sep 2015 16:00:43 +0800
Message-ID: <1441094443.341.0.camel@G08FNSTD140232>
References: <1440411596-2566-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440411596-2566-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

Ping! :)

Thanks and best regards,
Zeng

On Mon, 2015-08-24 at 18:19 +0800, Zeng Linggang wrote:
> Hello,
> 
> This patchset is for fgetgrent.3, fgetpwent.3, sigpause.3, termios.3,
> getspnam.3 and mallinfo.3
> 
> 1. fgetgrent.3 and fgetpwent.3:
>    We have some discussions about these two functions, the Subject:
>    "Re: question about markings of fgetgrent and fgetpwent"
>    However, something about the copyright impeded the progress.
>    I am sorry for that, if you are OK, please see these two patches below,
>    I have added some "FIXME:" descriptions in them.
> 
> 2. getspnam.3
>    getspnam.3 is a little like fgetgrent.3 and fgetpwent.3, but there are not
>    markings in glibc document. I use the function names for the identifiers like
>    fgetgrent.3 and fgetpwent.3.
> 
> 3. mallinfo.3
>    Hope the descriptions about "const:mallopt" could explain clearly enough in
>    the patch.
> 
> 4. sigpause.3 and termios.3
>    These two functions are safety in Linux kernel, the markings in glibc manual
>    are more detailed. I also have added some "FIXME:" descriptions in them.
> 
> 
> Thanks and best regards,
> Zeng
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
