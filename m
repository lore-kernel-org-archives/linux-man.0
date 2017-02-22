From: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] nftw(): clarify dangling symlinks case
Date: Wed, 22 Feb 2017 12:11:03 -0500
Message-ID: <23f174b0-5a52-213b-6fd8-4026c2b8fcc3@redhat.com>
References: <xnshn7hw5i.fsf@greed.delorie.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <xnshn7hw5i.fsf-wMSG6MF8/zxB8dkWVU3nKAC/G2K4zDHf@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: DJ Delorie <dj-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, codonell-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/21/2017 08:06 PM, DJ Delorie wrote:
> In the event that nftw() encounters a symbolic link which refers to a
> nonexisting file, the "struct stat" info will not have been filled in
> if FTW_PHYS is not specified (because stat() is used instead of
> lstat()).  This patch clarifies the documentation and corrects the
> sample code to reflect this.
> 
> Reported to Fedora in https://bugzilla.redhat.com/show_bug.cgi?id=1422736
> 
> patch is against today's git

Looks good to me. Thanks for fixing the man page.

-- 
Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
