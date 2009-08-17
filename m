From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH 0/3] Add pseudo-anonymous huge page mappings V3
Date: Mon, 17 Aug 2009 15:53:41 +0200
Message-ID: <87d46usg0q.fsf@basil.nowhere.org>
References: <cover.1250258125.git.ebmunson@us.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <cover.1250258125.git.ebmunson@us.ibm.com> (Eric B. Munson's message of "Fri, 14 Aug 2009 15:08:46 +0100")
Sender: owner-linux-mm@kvack.org
To: Eric B Munson <ebmunson@us.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org, akpm@linux-foundation.org, mtk.manpages@gmail.com
List-Id: linux-man@vger.kernel.org

Eric B Munson <ebmunson@us.ibm.com> writes:

> This patch set adds a flag to mmap that allows the user to request
> a mapping to be backed with huge pages.  This mapping will borrow
> functionality from the huge page shm code to create a file on the
> kernel internal mount and uses it to approximate an anonymous
> mapping.  The MAP_HUGETLB flag is a modifier to MAP_ANONYMOUS
> and will not work without both flags being preset.


You seem to have forgotten to describe WHY you want this?

>From my guess, this seems to be another step into turning hugetlb.c
into another parallel VM implementation. Instead of basically
developing two parallel VMs wouldn't it be better to unify the two?

I think extending hugetlb.c forever without ever thinking about
that is not the right approach.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
