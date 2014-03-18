From: Christoph Hellwig <hch@infradead.org>
Subject: Re: For review: open_by_name_at(2) man page
Date: Tue, 18 Mar 2014 02:43:21 -0700
Message-ID: <20140318094321.GA17024@infradead.org>
References: <53271B69.3000305@gmail.com>
 <20140318090007.3adee3d0@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140318090007.3adee3d0@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neilb@suse.de>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger@dilger.ca>, Christoph Hellwig <hch@infradead.org>
List-Id: linux-man@vger.kernel.org

On Tue, Mar 18, 2014 at 09:00:07AM +1100, NeilBrown wrote:
> ESTALE is also returned if the filesystem does not support file-handle ->
> file mappings.
> On filesystems which don't provide export_operations (/sys /proc ubifs
> romfs cramfs nfs coda ... several others) name_to_handle_at will produce a
> generic handle using the 32 bit inode and 32 bit i_generation.

Do we?  Seems like the code is erroring out early if there are no
export_ops?

> Does it?  My understanding from "man libblkid" (it is a while since I've read
> the code) is that it either uses info in /dev/disks/by-* or reads directly
> from the block devices (maybe using /sys to find them?) and interprets the
> superblock to extract a UUID.

It normally reads directly from disk, unless it has changed very
recently.
