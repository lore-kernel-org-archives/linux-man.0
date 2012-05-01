From: Jeff Moyer <jmoyer@redhat.com>
Subject: Re: [PATCH] Describe race of direct read and fork for unaligned buffers
Date: Tue, 01 May 2012 11:11:26 -0400
Message-ID: <x49ehr4lyw1.fsf@segfault.boston.devel.redhat.com>
References: <1335778207-6511-1-git-send-email-jack@suse.cz>
	<CAHGf_=qdE3yNw=htuRssfav2pECO1Q0+gWMRTuNROd_3tVrd6Q@mail.gmail.com>
	<CAHGf_=ojhwPUWJR0r+jVgjNd5h_sRrppzJntSpHzxyv+OuBueg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <CAHGf_=ojhwPUWJR0r+jVgjNd5h_sRrppzJntSpHzxyv+OuBueg@mail.gmail.com>
	(KOSAKI Motohiro's message of "Tue, 1 May 2012 10:37:20 -0400")
Sender: owner-linux-mm@kvack.org
To: KOSAKI Motohiro <kosaki.motohiro@gmail.com>
Cc: Jan Kara <jack@suse.cz>, Michael Kerrisk <mtk.manpages@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-man@vger.kernel.org, linux-mm@kvack.org, mgorman@suse.de, npiggin@gmail.com
List-Id: linux-man@vger.kernel.org

KOSAKI Motohiro <kosaki.motohiro@gmail.com> writes:

>> Hello,
>>
>> Thank you revisit this. But as far as my remember is correct, this issue is NOT
>> unaligned access issue. It's just get_user_pages(_fast) vs fork race issue. i.e.
>> DIRECT_IO w/ multi thread process should not use fork().
>
> The problem is, fork (and its COW logic) assume new access makes cow break,
> But page table protection can't detect a DMA write. Therefore DIO may override
> shared page data.

Hm, I've only seen this with misaligned or multiple sub-page-sized reads
in the same page.  AFAIR, aligned, page-sized I/O does not get split.
But, I could be wrong...

Cheers,
Jeff

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
