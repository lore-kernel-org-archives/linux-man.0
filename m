From: Ricardo Vegas <ricardovegas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [tfix] Logrotate - Size param typos
Date: Tue, 23 May 2017 11:28:29 +0200
Message-ID: <CAJftORGknsn5B9FfsE4vShqPaHhNtr+JDZOxV5JFoB0nZY--TQ@mail.gmail.com>
References: <CAJftORHs3efqqM8CBAYOefaTtQAjkNyU_O622k39=sO1pdnfYw@mail.gmail.com>
 <5923FE1D.6030008@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5923FE1D.6030008-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wharms-fPG8STNUNVg@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thank you!

On Tue, May 23, 2017 at 11:17 AM, walter harms <wharms-fPG8STNUNVg@public.gmane.org> wrote:
>
>
> Am 23.05.2017 10:45, schrieb Ricardo Vegas:
>> In the "SIZE" option, the following description:
>>
>>> Log files are rotated only if they grow bigger then size bytes. If size=
 is followed by k, the size is assumed to be in kilobytes. If the M is used=
, the size is in megabytes, and if G is used, the size is in gigabytes. So =
size 100, size 100k, size 100M and size 100Gare all valid.
>>
>> MUST be changed to:
>>
>>> Log files are rotated only if they grow bigger than size bytes. If size=
 is followed by k, the size is assumed to be in kilobytes. If the M is used=
, the size is in megabytes, and if G is used, the size is in gigabytes. So =
size 100, size 100k, size 100M and size 100G are all valid.
>> --
>
>
> You are right but logrotate is not part of the linux-man-pages.
>
> See here:
> https://github.com/logrotate/logrotate/blob/master/CONTRIBUTING.md
>
> re,
>  wh
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
