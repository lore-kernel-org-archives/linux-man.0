From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch] setxattr.2: Add ERANGE to 'ERRORS' section
Date: Thu, 1 Aug 2019 19:40:32 +0200
Message-ID: <f6c66c48-c983-ff97-3a0e-98d4f664b207@gmail.com>
References: <e7cde98960e380f638406b7ef359eb8c@inventati.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e7cde98960e380f638406b7ef359eb8c@inventati.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Finn O'Leary <finnoleary@inventati.org>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hello Finn,

On 7/31/19 9:53 PM, Finn O'Leary wrote:
> Hi,
> 
> Both the Ext2 filesystem handler and the Ext4 filesystem handler will
> return the ERANGE error code. Ext2 will return it if the name or value 
> is
> too long to be able to be stored, Ext4 will return it if the name is too
> long. For reference, the relevant files/lines (with excerpts) are:
> 
> fs/ext2/xattr.c: lines 394 to 396 in ext2_xattr_set
>>  394         name_len = strlen(name);
>>  395         if (name_len > 255 || value_len > sb->s_blocksize)
>>  396                 return -ERANGE;
> 
> fs/ext4/xattr.c: lines 2317 to 2318 in ext4_xattr_set_handle
>> 2317         if (strlen(name) > 255)
>> 2318                 return -ERANGE;
> 
> Other filesystems also return this code:
> 
> xfs/libxfs/xfs_attr.h: lines 53 to 55
>> * The maximum size (into the kernel or returned from the kernel) of an
>> * attribute value or the buffer used for an attr_list() call.  Larger
>> * sizes will result in an ERANGE return code.
> 
> It's possible that more filesystem handlers do this, a cursory grep 
> shows
> that most of the filesystem xattr handler files mention ERANGE in some
> form. A suggested patch is below (I'm not 100% sure on the wording 
> through).

Thanks. Patch applied, and I've done some rewording.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
