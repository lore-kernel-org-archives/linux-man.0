From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: thai tis-620.7 man page
Date: Mon, 2 Feb 2009 00:14:07 +1300
Message-ID: <cfd18e0f0902010314i5c843cc9mc4278457fcda9a87@mail.gmail.com>
References: <200902010858.09412.edimitro@tee.gr>
	 <cfd18e0f0902010213h16fd3652qa81438a584862a00@mail.gmail.com>
	 <200902011253.13034.edimitro@tee.gr>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200902011253.13034.edimitro-6VGm6rrshF0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: edimitro-6VGm6rrshF0@public.gmane.org
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[restored linux-man to CC]

Hi Lefteris,

On Sun, Feb 1, 2009 at 11:53 PM, Lefteris Dimitroulakis <edimitro@tee.g=
r> wrote:
> =D3=F4=E9=F2 Sunday 01 February 2009 12:13:42 =EF/=E7 Michael Kerrisk=
 =DD=E3=F1=E1=F8=E5:
>>
>> So, given that tis-620 and iso 8859-11 are nearly identical (as you
>> note in the iso_8859-11.7 NOTES), I ask myself: do we really need bo=
th
>> pages?  Maybe there is a good reason, of which I am ignorant. Can yo=
u
>> say something on this?
>>
> I' embedding here the answer I got from
> Thanomsub Noppaburana <donga.nb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ********************************************************************
> 2009/1/28 Lefteris Dimitroulakis <edimitro-6VGm6rrshF0@public.gmane.org>:
>> ISO-8859-11 is it used also with your language or
>> actually nobody is intrested since the difference
>> with TIS-620 is only the "NO-BREAK SPACE" ?.
>>
>
> In fact, we are still trying to replace the reference of TIS-620 to
> ISO8859-11 especially in many parts of Linux, GNU programs and X.org
> because we think that TIS-620-0 and ISO8859-11 are the same.
>
> E.g.: Lets look at the header of
> /usr/share/fonts/encodings/iso8859-11.enc (may be in the other place)=
:
>
> STARTENCODING iso8859-11
> ALIAS tis620-0
> ALIAS tis620.2529-1
> ALIAS tis620.2533-1
> ALIAS tis620.2533-0
>
> The ugly thing: MS WIndows is always use it's Non-Standard encoding -
> "Windows-874" for Thai.
>
> Cheers,
> Donga.
> *********************************************************************=
**
>
> So even thought the difference is minimal I think that some how it
> should be a man page with the name tis-620.7 .
> Maybe It could be an empty page pointing to iso_8859-11 as the latin.=
?.7 ?

That would seem more reasonable.  So, I'll create a tis-620.7 link
page (like latin?.7) that points to iso_8859-11.7, with the latter
having a note on the one character difference between the two.  Okay?

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
