From: Christoph Hellwig <hch@infradead.org>
Subject: Re: For review: open_by_name_at(2) man page
Date: Tue, 18 Mar 2014 02:37:51 -0700
Message-ID: <20140318093751.GA8068@infradead.org>
References: <53271B69.3000305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53271B69.3000305@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger@dilger.ca>, NeilBrown <neilb@suse.de>
List-Id: linux-man@vger.kernel.org

Hi Michael,

the man page looks reasonable.  If you refer to openat(2) instead of
open(2) in the ERRORS section you could avoid duplicating a few of the
dirfd and flags related errors.
