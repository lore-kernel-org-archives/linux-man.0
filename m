From: "J. Bruce Fields" <bfields-uC3wQj2KruNg9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC v1 01/19] Don't copy beyond the end of the file
Date: Mon, 6 Mar 2017 14:23:01 -0500
Message-ID: <20170306192301.GB2294@fieldses.org>
References: <20170302160123.30375-1-kolga@netapp.com>
 <20170302160123.30375-2-kolga@netapp.com>
 <20170302162221.GA6854@infradead.org>
 <20170303204747.GE13877@fieldses.org>
 <4B2A2E86-AFC8-49EA-9D53-7A53AD824CF1@netapp.com>
 <20170303213230.GF13877@fieldses.org>
 <B3F80DA0-B4F8-4628-88C5-E5C047620F17@netapp.com>
 <20170304021008.GB21609@fieldses.org>
 <924FF7A2-27CD-4848-BD61-748758C2533F@netapp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <924FF7A2-27CD-4848-BD61-748758C2533F-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Trond.Myklebust-7I+n7zu2hftEKMMhf/gKZA@public.gmane.org, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olga Kornievskaia <kolga-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Mar 06, 2017 at 11:27:23AM -0500, Olga Kornievskaia wrote:
> I don’t see copy_file_range() specifying that 0 means end of the file.

Is there a reason that copy_file_range shouldn't be like read?  (From
read(2): "On  success,  the number of bytes read is returned (zero
indicates end of file)".

I haven't checked, but suspect that's already true of the
implementations we have.

Also, from copy_file_range():

	EINVAL Requested  range  extends beyond the end of the source
		file; or the flags argument is not 0.

Some filesystems do this, some don't; I think the man page should make
it clear that this behavior is not required.

--b.
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
