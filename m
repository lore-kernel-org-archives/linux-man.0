From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: errno "SEE ALSO" link on each page which returns errno values
Date: Mon, 7 May 2012 06:14:46 +1200
Message-ID: <CAKgNAkj5UsnjU2uXijeYrYF-_Z6z9vgGgiP-7sH1NJ9pi7nrGw@mail.gmail.com>
References: <CAGc9EvdiKU=YC_ff6OGQk2Lz5J4oduotXB2f7yWZSGWbpQEcYw@mail.gmail.com>
 <CAKgNAkhVZ4KpUUCdavC0-k6OdO3f4356rWo1vSpY8CEDbpXZ8Q@mail.gmail.com>
 <4F8DD953.9050704@jguk.org> <CAKgNAkjQOEjH8iyMfm0K8FcqvDMFmj6KPfoxGNmwxfH5HBu5cA@mail.gmail.com>
 <4FA69ECE.8000505@jguk.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FA69ECE.8000505-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, May 7, 2012 at 3:54 AM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
>
>
> On 18/04/12 21:47, Michael Kerrisk (man-pages) wrote:
>>
>> On Wed, Apr 18, 2012 at 8:57 AM, Jon Grant<jg-hus3n9K41k0@public.gmane.org> =A0wrote:
>>>
>>>
>>> On 17/04/12 20:45, Michael Kerrisk (man-pages) wrote:
>
> [..]
>
>>> errno is a relevant link IMHO. Otherwise we have to click out, navi=
gate
>>> to
>>> the page manually.
>>
>>
>> Okay. I'll add that.
>>
>> Thanks,
>>
>> Michael
>
>
> Hi
>
>
> Will this errno link be on all "SEE ALSO"?
>
> I checked two, but these did not have the link:
>
> http://man7.org/linux/man-pages/man2/close.2.html
>
> http://man7.org/linux/man-pages/man3/fopen.3.html

Hi Jon,

The rendering changes will come out with the 3.41 release. The pages
won't change (there's no point in adding "errno" to the SEE ALSO of
every page), but the html rendering will link errno to errno(3).

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
