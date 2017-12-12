From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/1] s390_sthyi.2: New page for s390-specific
 s390_sthyi(2)
Date: Tue, 12 Dec 2017 19:10:27 +0100
Message-ID: <995e5848-6c2c-ec05-47fc-201d4de31ce8@gmail.com>
References: <20171123134527.23505-1-haoqf@linux.vnet.ibm.com>
 <8c6f1263-8797-4065-250c-45ef0b74ebfb@gmail.com>
 <e6b0882b-520a-786d-2759-e0ed442e9262@linux.vnet.ibm.com>
 <CAKgNAki7JYz9uZvDHcPcQa3_UxEAimqeOi=RqOQQOfogXa7mdg@mail.gmail.com>
 <67628aaf-1611-6b00-81d8-f644dc643748@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <67628aaf-1611-6b00-81d8-f644dc643748-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Christian Borntraeger <borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, raspl-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/12/2017 06:41 AM, QingFeng Hao wrote:

>> Reflecting on this further, I wonder about changing the name of that
>> argument in the man page from "buffer" to (say) "resp_buffer". The
>> problem is that the term "buffer" (which I realize is what is used in
>> the kernel source code) is very generic. A more descriptive name in
>> the man page would be helpful I think. (I even think it would be more
>> helpful in the source code, but that's another story.) What do you
>> think?
> I agree to use resp_buffer to reflect that it's for the response. Thanks!

Thanks. I've made than change.

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
