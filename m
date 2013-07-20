From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Bug in documentation
Date: Sun, 21 Jul 2013 00:28:13 +0200
Message-ID: <51EB0EFD.40706@gmail.com>
References: <94A07449C751564EBBCDD7481A3E829E104E60@MIVEXEMEA1N2.corp.nai.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <94A07449C751564EBBCDD7481A3E829E104E60-vsg8/t6Ur8szk0z/ZuOLCTkPmBWM+Ckf2LY78lusg7I@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felix_Schulte-dDVk9ABzqyjQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/19/13 13:37, Felix_Schulte-dDVk9ABzqyjQT0dZR+AlfA@public.gmane.org wrote:
> Hi!
> 
> The documentation for inotify is a bit misleading
> (http://man7.org/linux/man-pages/man7/inotify.7.html)
> 
> It says when describing the "mask" field:
> IN_MOVED_FROM     File moved out of watched directory (*).
> 
> The description is not correct, since this event is also fired (on
> read()) when a file is moved *within* the same directory (to a new name)
> and is explicitly *not* *moved out* of the directory.
> 
> It's not a big deal, of course, I just was confused about it recently.

Hello Felix,

I agree, it could be clearer. I revised the text to read:

           IN_MOVED_FROM     Generated  for  the  directory containing the
                             old filename when a file is renamed (*).
           IN_MOVED_TO       Generated for the  directory  containing  the
                             new filename when a file is renamed (*).

Okay?

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
