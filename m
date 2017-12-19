From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fcntl.2, read.2, write.2: document "Lost locks" as cause
 for EIO.
Date: Tue, 19 Dec 2017 06:48:50 +0100
Message-ID: <130530e8-83bc-35d3-b84c-9bee85ddee12@gmail.com>
References: <87lgi7nttp.fsf@notabene.neil.brown.name>
 <df9a18ce-c412-44aa-d475-77521a7252c5@gmail.com>
 <87shc7lnfs.fsf@notabene.neil.brown.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87shc7lnfs.fsf-wvvUuzkyo1HefUI2i7LXDhCRmIWqnp/j@public.gmane.org>
Content-Language: en-US
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/18/2017 10:45 PM, NeilBrown wrote:
> On Mon, Dec 18 2017, Michael Kerrisk (man-pages) wrote:
> 
>> Hello Neil
>>
>> There's a piece of your patch I don't understand. Please see below.
>>
>> On 12/13/2017 05:19 AM, NeilBrown wrote:
>>>
>>> If an advisory lock is lost, then read/write requests on any
>>> affected file descriptor can return EIO - for NFSv4 at least.
>>>
>>> Signed-off-by: NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
>>> ---
>>>  man2/fcntl.2 | 24 ++++++++++++++++++++++++
>>>  man2/read.2  |  9 +++++++++
>>>  man2/write.2 |  9 +++++++++
>>>  3 files changed, 42 insertions(+)
>>>
>>> diff --git a/man2/fcntl.2 b/man2/fcntl.2
>>> index 67642384154c..6e6e26f66aa0 100644
>>> --- a/man2/fcntl.2
>>> +++ b/man2/fcntl.2
>>> @@ -669,6 +669,30 @@ and
>>>  Mandatory locking is not specified by POSIX.
>>>  Some other systems also support mandatory locking,
>>>  although the details of how to enable it vary across systems.
>>> +.SS Lost locks
>>> +When an advisory lock is obtained on a networked filesystem such as
>>> +NFS it is possible that the lock might get lost.
>>> +This may happen due to administrative action on the server, or due to a
>>> +network partition which lasts long enough for the server to assume
>>
>> What does "network partition which lasts long enough" mean?
>> I think this perhaps needs to be clarified a little. At least,
>> I don't understand it.
> 
> "network partition" is a term using the NFS RFCs for any situation that
> that results in the server and client not being able to communicate
> (that are partitioned, one from the other?  There is partition (wall)
> between them?  They are in separate partitions?).
> I can see how the meaning might not be obvious if you hadn't come across
> it before.
> 
> If we change "network partition" to "loss of connectivity", would that
> make it clear.  Is "loss of network connectivity with the server" too
> verbose?

Thanks, Neil. I've applied your patch and added the words "loss of network
connectivity with the server".

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
