From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH 2/3] strcmp.3: Reference strstr(3)
Date: Mon, 1 Jun 2009 15:54:15 +0200
Message-ID: <20090601135415.GB31043@machine.or.cz>
References: <1835422551-6657-1-git-send-email-mark@pogo.org.uk> <1835422551-6657-2-git-send-email-mark@pogo.org.uk> <cfd18e0f0906010559i6a6c61d7g3c625a7a04de4323@mail.gmail.com> <alpine.BSO.2.00.0906011413080.32660@zrgural.vwaro.pbz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.BSO.2.00.0906011413080.32660-W2yLvLHlugRLAO5i3VPXnKVXKuFTiq87@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Jun 01, 2009 at 02:15:31PM +0100, Mark Hills wrote:
> On Mon, 1 Jun 2009, Michael Kerrisk wrote:
>
>> Mark,
>>
>> Why do you think this patch is needed?
>
> I deemed that strstr() was relevant as the 'other' string comparison  
> function, but didn't go as far as to reference character-based functions  
> like strchr(). Apologies that the commit message didn't explain this.
>
> However, after sending the patch I was made aware of string(3). To make 
> it easy to discover the string functions (as this patch intended to do) 
> would it be more appropriate for all functions listed in string(3) to 
> reference it?

I'd agree, I've never known of string(3) either.

-- 
				Petr "Pasky" Baudis
The lyf so short, the craft so long to lerne. -- Chaucer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
