From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: For review: open_by_name_at(2) man page
Date: Tue, 18 Mar 2014 14:30:14 +0100
Message-ID: <53284A66.10402@gmail.com>
References: <53271B69.3000305@gmail.com> <20140318090007.3adee3d0@notabene.brown> <53283D7A.1020409@gmail.com> <20140318130708.GA13031@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140318130708.GA13031@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: mtk.manpages@gmail.com, NeilBrown <neilb@suse.de>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger@dilger.ca>
List-Id: linux-man@vger.kernel.org

On 03/18/2014 02:07 PM, Christoph Hellwig wrote:
> That's why the file handles contain a generation counter that gets
> incremented in this case.

Ahh, yes. Thanks for the reminder/clue.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
