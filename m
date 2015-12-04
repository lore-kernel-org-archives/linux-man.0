From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: erroneous scanf's %s pointer description
Date: Fri, 4 Dec 2015 20:08:00 +0100
Message-ID: <CAKgNAkhnXUqOra16E_s5t0vN5QST-2nMw5n+fbC2U8WMto0TyQ@mail.gmail.com>
References: <20151202133643.62758daf@tauner-w510>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151202133643.62758daf@tauner-w510>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Tauner <tauner-1IEs1BiS2Ng4SCxGYwAy/16hYfS7NtTn@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Stefan,

On 2 December 2015 at 13:36, Stefan Tauner <tauner-1IEs1BiS2Ng4SCxGYwAy/16hYfS7NtTn@public.gmane.org> wrote:
> Hi,
>
> I have noticed that the description about the %s type modifier in
> the official scanf man page is a bit misleading (man3/scanf.3:454). It
> currently states "the next pointer must be a pointer to character
> array". However the (C99) standard says "the corresponding argument
> shall be a pointer to the initial element of a character array".

Fair enough. I changed the text of the page as you suggest. Thanbks
for the report.

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
