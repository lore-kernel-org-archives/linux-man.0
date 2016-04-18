From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: [PATCH 0/7] Improve support for compressed man pages
Date: Mon, 18 Apr 2016 17:08:06 +0200
Message-ID: <5714F856.9090206@bfs.de>
References: <20160416022503.1df762cb.alex.miller@gmx.de> <20160416045058.GS6588@vapier.lan> <20160416183013.352f4ba6.alex.miller@gmx.de> <20160418144918.GK5369@vapier.lan>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160418144918.GK5369-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 18.04.2016 16:49, schrieb Mike Frysinger:
> On 16 Apr 2016 18:30, Alexander Miller wrote:
>> On Sat, 16 Apr 2016 00:50:58 -0400
>> Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
>>>  if no one
>>> is using this code, then it's just sucking up space.
>>
>> I'm not concerned about the space, but code needs to be maintained.
>> IMO, as long as it works, we can keep it; if it has issues we'd
>> better remove it.
> 
> sorry for the ambigious term ... i'm not referring to disk space, but
> to the code "sucking up space in the Makefiles and our eyes".
> 
>> We can drop compression support or do it right - I'm fine with
>> either option. We shouldn't keep the status quo, though.
> 
> i'm not advocating for the status quo ;)
> -mike

as one of those people that like to have it directly from source ...

I would advocate for having just one compression type .gz would be ok.
space i nowadays not the main concern but it is convinced to have.

re,
 wh
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
