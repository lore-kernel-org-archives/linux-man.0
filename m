From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: capabilities.7 bug
Date: Fri, 26 Feb 2016 16:32:37 +0100
Message-ID: <56D07015.3070508@gmail.com>
References: <57293b5ae5201df06141bc43a5cea72a@openmailbox.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57293b5ae5201df06141bc43a5cea72a-1Ww2luigxekRVMDPamJrIw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: blackmoor-1Ww2luigxekRVMDPamJrIw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Marianne,

On 02/26/2016 01:05 PM, blackmoor-1Ww2luigxekRVMDPamJrIw@public.gmane.org wrote:
> Hello,
> 
> I found a bug in the capabilities.7 manual page, in the latest git 
> revision (e92f04afa522316c1df54819b45db46e5663b72d).
> 
> Line 1124 reads SECBIT_NO_CAP_AMBIENT_RAISE, but should be 
> SECBIT_NO_CAP_AMBIENT_RAISE_LOCKED

Thanks for the report. Fixed now.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
