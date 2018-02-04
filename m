From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] shutdown(2): Add backlink to close(2)
Date: Sun, 4 Feb 2018 07:28:46 +0100
Message-ID: <c36ba4e8-492d-3432-61df-5262e67bcacc@gmail.com>
References: <20180125143842.03800061@max.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180125143842.03800061-2WZS4fnCeGImYvmMESoHnA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carsten Grohmann <carstengrohmann-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Carsten

On 01/25/2018 02:38 PM, Carsten Grohmann wrote:
> Hi Michael,
> 
> The close(2) man page contains in the "SEE ALSO" section a reference to
> shutdown(2). But shutdown(2) doesn't have the back reference.
> 
> I think the backlink is useful, because both calls can be used to close
> sockets.
> 
> The attached patch adds the backlink.

Thanks. Patch applied. (For the future: inline patches are easier for me 
to deal with.)

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
