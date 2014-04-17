From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v5 10/10] manpage: update FALLOC_FL_COLLAPSE_RANGE flag
 in fallocate
Date: Thu, 17 Apr 2014 08:59:59 -0700
Message-ID: <20140417155959.GA24231@infradead.org>
References: <1392741594-20335-1-git-send-email-linkinjeon@gmail.com>
 <20140416060510.GA25651@infradead.org>
 <534FD9B5.3000207@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <534FD9B5.3000207@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Namjae Jeon <linkinjeon@gmail.com>, linux-man@vger.kernel.org, Theodore T'so <tytso@mit.edu>, Dave Chinner <david@fromorbit.com>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Thu, Apr 17, 2014 at 03:40:05PM +0200, Michael Kerrisk (man-pages) wrote:
> On 04/16/2014 08:05 AM, Christoph Hellwig wrote:
> > Michael, can you apply this now that we merged FALLOC_FL_COLLAPSE_RANGE
> > into the kernel tree?
> 
> I've applied Namjae Jeon's patch (thanks Namjae!), and done a lot of
> tweaking to generate the patch below.
> 
> Along the way I noticed that there is an inconsistency between XFS
> and JFS that should be fixed (and so have added Dave and Ted to CC,

ext4?

Anyway, the documentation looks good to in general, but do you really think
mentioning git commit hashs in a man page is a good idea?
