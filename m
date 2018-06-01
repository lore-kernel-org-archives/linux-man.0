From: Alex Richman <alex.r@gblabs.co.uk>
Subject: mlock() confusing 1 half of system RAM limit
Date: Fri, 1 Jun 2018 10:53:57 +0100
Message-ID: <c43ad840-dcab-b86f-bf15-ffb26b66d37b@gblabs.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: linux-man@vger.kernel.org, linux-mm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hi,

I'm seeing a 1/2 of system RAM limit when calling mlock().  mlock(2) says:
 > ENOMEM (Linux 2.4 and earlier) the calling process tried to lock more 
than half of RAM.
Which implies to me that the 1 half of system RAM limit should be only 
Linux 2.4 and earlier, but I'm running linux 4.4.127 and still seeing 
the limit.

This is on a system with 66007168 KB total memory, locking 33794621440 
bytes works, locking 33795653632 bytes does not work.

Anyone know if this is the man pages or the kernel or something unrelated?

More details here: 
https://stackoverflow.com/questions/50639709/mlock-of-large-shm-address-range-fails-with-enomem-even-with-lots-of-free-memo

Thanks,
- Alex.

-- 
Alex Richman
alex.r@gblabs.co.uk
Engineering
GB Labs
2 Orpheus House,
Calleva park,
Reading
RG7 8TA
Tel:+44 (0)118 455 5000
www.gblabs.com



The information contained in this message and any attachment may be proprietary, confidential and privileged.
If the reader of this message is not the intended recipient, or an employee or agent responsible for delivering
this message to the intended recipient, you are hereby notified that any dissemination, distribution or copying
of this communication is strictly prohibited. If you received this communication in error, please contact me immediately,
and delete the communication (including attachments, if applicable) from any computer or network system.
