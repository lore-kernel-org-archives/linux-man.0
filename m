From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Misspelling in pthread_getattr_np man page
Date: Sun, 19 Sep 2010 07:03:34 +0200
Message-ID: <AANLkTinSo+3gjRUssn=WL3pg-9aq7Q75vNU3LJo7mTbC@mail.gmail.com>
References: <4B054758.8000602@ispras.ru> <AANLkTi=XTJDCMd4H88Rp=M31hB5x1Qov5NFCmdvZO6SK@mail.gmail.com>
 <AANLkTikw5caU=inGnGaNxG2hQAHrKwBr1nM4iH98vzDK@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikw5caU=inGnGaNxG2hQAHrKwBr1nM4iH98vzDK-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Denis Silakov <silakov-ufN2psIa012HXe+LvDLADg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Sep 15, 2010 at 11:13 PM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> On 2010/9/9 Michael Kerrisk wrote:
>> Hello Denis
>>
>> 2009/11/19 Denis Silakov <silakov-ufN2psIa012HXe+LvDLADg@public.gmane.org>:
>>> Man pthread_getattr_np, 'CONFORMING TO' section - "... GNU extensio=
n.
>>> hence the ..." - replace '.' with ';' after 'extension'.
>>
>> Fixed for man-pages-3.27.
>
> Hello Michael,
>
> A spurious s has been added in 0a96a9f:
> =A0This function is a nonstandard GNU extension*s*;
>
> See
> =A0http://git.kernel.org/?p=3Ddocs/man-pages/man-pages.git;a=3Dcommit=
diff;h=3D0a96a9f;hp=3D583dc9a
>
> Another Denis

Thanks. Fixed.

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
