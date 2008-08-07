From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: error in shmctl(2) man page
Date: Thu, 07 Aug 2008 15:34:19 +0200
Message-ID: <489AF9DB.2040401@gmail.com>
References: <200807301849.07626.filippo.santovito@email.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200807301849.07626.filippo.santovito-06ZeP6ie+xM@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Filippo Santovito <filippo.santovito-06ZeP6ie+xM@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Filippo,

Filippo Santovito wrote:
> hi,
> in shmctl(2) man page the ipc_perm struct contains a key field 
> while /usr/include/bits/ipc.h (included in /usr/include/sys/ipc.h) ipc_perm 
> has a __key field.
> which is the error? the h header or the man page?
> thank you for your attention.

Thanks for spotting this.  Of course, it is the man page that is in error.
And in fact the same problem is present for the seq field.  And the same
problems are also present in the semctl(2) and msgctl(2) pages.  All of
this has been fixed for man-pages-3.07.

Thanks for your report!

Cheers

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
