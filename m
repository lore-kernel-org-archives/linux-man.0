From: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Subject: Re: st_size of a symlink
Date: Tue, 24 Jul 2012 12:16:59 +0200
Message-ID: <500E761B.4040705@nod.at>
References: <500D73FF.1070504@nod.at> <alpine.LNX.2.00.1207231959410.1922@swampdragon.chaosbits.net> <20120723202224.GH31729@ZenIV.linux.org.uk> <alpine.LNX.2.00.1207232243110.1922@swampdragon.chaosbits.net> <500DCB34.6050209@nod.at> <20120723231333.GA1299@gaara.hadrons.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120723231333.GA1299-v62vTE6/wQGgM1MOaoewpti2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Cc: Jesper Juhl <jj-IYz4IdjRLj0sV2N9l4h3zg@public.gmane.org>, Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 24.07.2012 01:13, Guillem Jover wrote:
> Well, can't the link be accessed when getting the stat information
> then?

Sure, but it's not trivial.

>> IMHO the lstat() and readlink() manpages have to be more precise
>> about st_size.
>
> They document what POSIX says:

This does not make it any better...

Thanks,
//richard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
