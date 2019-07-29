From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Error (?) in man page for ppoll(2)
Date: Mon, 29 Jul 2019 20:56:11 +0200
Message-ID: <0afd8564-d9b2-0055-3a09-075e1d0d0ad8@gmail.com>
References: <Pine.LNX.4.44L0.1907290921180.20498-100000@netrider.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.1907290921180.20498-100000@netrider.rowland.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

>> +The timeout value expressed in
>> +.IR *ip
>> +is invalid (nragtive).
> ----------------^^^
> 
> Typo.  Otherwise, I approve of the patch.

Thanks! Fixed.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
