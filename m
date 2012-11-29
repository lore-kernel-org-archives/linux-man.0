From: YOSHIFUJI Hideaki <yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org>
Subject: Re: [RFC] if_nameindex.3: New page documenting if_nameindex(3) and
 if_freenameindex(3)
Date: Thu, 29 Nov 2012 20:07:07 +0900
Message-ID: <50B741DB.3060808@linux-ipv6.org>
References: <201211161728.qAGHSMj0015535@94.43.138.210.xn.2iij.net> <CAKgNAkgJ28rsi4fLb_afX=mdfhsYvAm3H_k0qHpihoTfNFF0og@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgJ28rsi4fLb_afX=mdfhsYvAm3H_k0qHpihoTfNFF0og-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: YOSHIFUJI Hideaki <yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi, Michael.

Michael Kerrisk (man-pages) wrote:
> On Fri, Nov 16, 2012 at 6:28 PM, YOSHIFUJI Hideaki
> <yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org> wrote:
>> Please review.
> 
> Thanks Hideaki.
> 
> I've merged this into a branch, made a number of fixes, and added an
> example program. Could you check my changes in the diff below. (The
> complete page is attached.)

> +    for (i = if_ni; ! (i\->if_index == 0 && i\->if_name == NULL); i++)
> +        printf("%d: %s\\n", i\->if_index, i\->if_name);

Since type of if_index is unsigned int, please use %u here.
Thanks.

--yoshfuji

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
