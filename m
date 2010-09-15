From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Misspelling in pthread_getattr_np man page
Date: Wed, 15 Sep 2010 23:13:09 +0200
Message-ID: <AANLkTikw5caU=inGnGaNxG2hQAHrKwBr1nM4iH98vzDK@mail.gmail.com>
References: <4B054758.8000602@ispras.ru>
	<AANLkTi=XTJDCMd4H88Rp=M31hB5x1Qov5NFCmdvZO6SK@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=XTJDCMd4H88Rp=M31hB5x1Qov5NFCmdvZO6SK-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Denis Silakov <silakov-ufN2psIa012HXe+LvDLADg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 2010/9/9 Michael Kerrisk wrote:
> Hello Denis
>
> 2009/11/19 Denis Silakov <silakov-ufN2psIa012HXe+LvDLADg@public.gmane.org>:
>> Man pthread_getattr_np, 'CONFORMING TO' section - "... GNU extension.
>> hence the ..." - replace '.' with ';' after 'extension'.
>
> Fixed for man-pages-3.27.

Hello Michael,

A spurious s has been added in 0a96a9f:
  This function is a nonstandard GNU extension*s*;

See
 http://git.kernel.org/?p=docs/man-pages/man-pages.git;a=commitdiff;h=0a96a9f;hp=583dc9a

Another Denis
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
