Received: from mail.ekdawn.com (mail.ekdawn.com [159.69.120.39])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73AED4F
	for <linux-man@vger.kernel.org>; Wed, 13 Dec 2023 05:58:14 -0800 (PST)
Received: from [10.42.0.205] (dynamic-176-003-200-079.176.3.pool.telefonica.de [176.3.200.79])
	by mail.ekdawn.com (Postfix) with ESMTPSA id EABEF181004;
	Wed, 13 Dec 2023 13:58:04 +0000 (UTC)
Message-ID: <252ebf4b-090f-4e89-a406-2d382a5ebf69@horse64.org>
Date: Wed, 13 Dec 2023 14:57:35 +0100
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Suggestion for clarifications on "man 5 proc" page regarding
 /proc/[pid]/self race conditions
Content-Language: en-US
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Petr Gajdos <pgajdos@suse.cz>
References: <e170ffa6-986a-4e55-9d44-27d7d7520151@horse64.org>
 <ZXhrblTGLBirUpki@debian> <c78fe5eb-65cd-4705-8628-d07240906bff@horse64.org>
 <ZXiaxx3mjXhLDayT@debian> <2c20d504-e6a4-476e-879f-be5618a4fd35@horse64.org>
 <ZXl53MYCgFRMSYUG@debian> <ZXm3kXJF-FGtbMxf@debian>
From: ellie <el@horse64.org>
In-Reply-To: <ZXm3kXJF-FGtbMxf@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Yes, that makes sense. I suspect that you are correct. However, it would 
be nice to have a definite confirmation by someone, hence also my 
suggestion to address it in the man page.

I can make and send a patch suggestion (I hope I'll figure out the 
correct format) in a few days with actual man page text changes under 
the assumption that open("/proc/self/exe") is free of races, but I'm 
probably not the person to actually verify that this assumption is correct.

On 12/13/23 2:54 PM, Alejandro Colomar wrote:
> Hi ellie,
> 
> On Wed, Dec 13, 2023 at 10:31:02AM +0100, Alejandro Colomar wrote:
>> I'm going to guess a little bit, from the following script:
>>
>> 	$ cat ppe.sh
>> 	#!/home/alx/tmp/bash
>>
>> 	f="$(readlink /proc/$$/exe)";
>>
>> 	set -x;
>>
>> 	mv $f $f.bak;
>> 	cp /usr/bin/bash $f;
>> 	readlink /proc/$$/exe;
>>
>> 	cp /usr/bin/bash $f.bak;
>> 	readlink /proc/$$/exe;
>>
>> 	rm $f.bak;
>> 	readlink /proc/$$/exe;
>>
>> 	echo malicious >$f.bak;
>> 	readlink /proc/$$/exe;
>>
>> 	head -c4 /proc/$$/exe;
> 
> On 12/13/23 10:31 AM, Alejandro Colomar wrote:
>> There don't seem to be any
>> races in open("/proc/[pid]/exe", ...).
> 
> ellie wrote:
> | Sorry if I'm just confused, but I don't understand how the given test
> | script reproduces or tests anything relevant to a potential open() race.
> |
> | The race would work like this:
> |
> | 1. Process A issues open("/proc/self/exe")
> |
> | 2. Process A's open() on /proc/self/exe heads into whatever libc or
> | kernel path that resolves where that symlink points to a path, if it's
> | treated as one.
> |
> | 3. Process scheduler switches to process B.
> |
> | 4. Process B switches out process A's binary, such that a different
> | binary is now at the old path.
> |
> | 5. Process A's open() code in libc or kernel space resumes and opens the
> | file pointed to by the given path, which is now a new binary.
> |
> | I'm pretty sure you can't test that anyway to rule it out, that could
> | only be answered by looking at all the relevant code and whether
> | /proc/self/exe is ever resolved to a path (like I assume an actual
> | symlink usually is) or directly to an inode (which would likely be safe).
> 
> I didn't test exactly that, but I proved that it doesn't work like a
> symlink.  If it were a simple symlink, my script wouldn't get the new
> path of the file after moving or removing it, and the symlink would
> become dangling.
> 
> Still, the kernel could do the stupid thing: magically update the
> symlink when the file changes, but still use a symlink, so open(2) would
> still have a race.  I'm assuming the kernel doesn't do that stupid thing.
> 
> It must be implemented using the file description, or something like
> that, and thus it would be free of races.
> 
> Have a lovely day,
> Alex
> 
