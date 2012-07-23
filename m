From: Richard Weinberger <richard@nod.at>
Subject: Re: st_size of a symlink
Date: Tue, 24 Jul 2012 00:07:48 +0200
Message-ID: <500DCB34.6050209@nod.at>
References: <500D73FF.1070504@nod.at> <alpine.LNX.2.00.1207231959410.1922@swampdragon.chaosbits.net> <20120723202224.GH31729@ZenIV.linux.org.uk> <alpine.LNX.2.00.1207232243110.1922@swampdragon.chaosbits.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1207232243110.1922@swampdragon.chaosbits.net>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Jesper Juhl <jj@chaosbits.net>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On 23.07.2012 22:47, Jesper Juhl wrote:
>> Fix it _how_?
>
> By returning the size as the number of bytes in the name the link is
> currently pointing at.

This is not easy.
procfs has no clue where the link pointing at.
The information is generated while accessing the link.
tmpfs on the other hand has this information because symlinks get only 
changed through tmpfs...

>>   By retrying readlink() with bigger buffer.
>> With procfs there's just a few more ways the readlink() output can
>> change, that's all.
>>
> Still not a good reason to just return 0 IMHO.

IMHO the lstat() and readlink() manpages have to be more precise about 
st_size.

Thanks,
//richard
