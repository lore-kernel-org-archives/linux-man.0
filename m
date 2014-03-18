From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: For review: open_by_name_at(2) man page
Date: Tue, 18 Mar 2014 13:41:56 +0100
Message-ID: <53283F14.6070303@gmail.com>
References: <53271B69.3000305@gmail.com> <20140318093751.GA8068@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140318093751.GA8068@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: mtk.manpages@gmail.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger@dilger.ca>, NeilBrown <neilb@suse.de>
List-Id: linux-man@vger.kernel.org

On 03/18/2014 10:37 AM, Christoph Hellwig wrote:
> Hi Michael,
> 
> the man page looks reasonable.  If you refer to openat(2) instead of
> open(2) in the ERRORS section you could avoid duplicating a few of the
> dirfd and flags related errors.

Good idea. Done.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
