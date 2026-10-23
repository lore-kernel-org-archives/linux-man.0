Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792783950;
	b=ELvBVoANH56p1S8ZSkKcBG1BzfSa2zcCcFbeAWVbbZ5WJHcm6VzsRDPhjaSTyT7DZ95d
	 KXLetH9oLkH/MIaO1xN/JHaUPhAtYWiMP/pC2rojgMUceFm+gDD4FqGOgnofVGnjKNZRm
	 L/2HmXlbkEks9H3GARQEniLoLVcIUh1Y3cKcbgV45Hgub0g5TrsCMqzTsQh3/nFKhXcBr
	 kqY4dKCDS8gdFe+WsLuK9yQe5npgpap8dbBL+L2u/16JV4GQ9ETz+uwY4dd9CXDTUYuJl
	 28deP2VXLOI9nATzR7enmsfftYA6ahedM/Kztev1UfY1G85DZ5e7/368w36we9Rz/aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xQ0ZY845r5Du+UUOa8gVSKQGxBME1IJCKr0CS/df4CI=;
	b=uWijepDFsfuLo29OpPxPKVNPuvN9tdU4zgpy4Vq4x80ZFnO9Fu2NCLndkFv0CfsAhxMD
	 9Qp5W9w97JKORPoo2sncu8u7OqKGafZf8WHEgzglw3OgncWVpQW00hvH4naVsJdy9RMHK
	 9ZLi8Oi2k0NMjh7OM3Oev6WUP1tAPs+vXw07WK/g31zUDboKX6ajeGiaNN0JVvHkWAGjp
	 5nxGEjPkfSdl2cMoCn/KM6tSnkbb+SgfnhjFaKYoChV6Rg7Pj8p8wbsJ0GW0J6LpblLYY
	 zkmYzxGKaX8T+B7XpZi3+Ep2ocKCZaHaM0aG8jmkjxU5L8Wa5e9E6G19w7+/nX4FWLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=colorfullife.com;
	spf=pass smtp.mailfrom=colorfullife.com;
	dkim=pass header.d=colorfullife-com.20251104.gappssmtp.com header.i=@colorfullife-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=IJwkHIua;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EDD606A31A
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 19:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13EDD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=colorfullife.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=colorfullife.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=colorfullife-com.20251104.gappssmtp.com header.i=@colorfullife-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=IJwkHIua
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a218ffa23dso4668565e9.0
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 12:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20251104.gappssmtp.com; s=20251104; t=1792783947; x=1793388747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQ0ZY845r5Du+UUOa8gVSKQGxBME1IJCKr0CS/df4CI=;
        b=IJwkHIuahlX2XmMgrR2c4biFHA3eskauE3h6uVTKAANKlsfhz+huia0jeSfgkqD9te
         yCHvIxkXbcIe6zPAb07HORwwUJqgaZefo4YbLOzzVt0oVupxczkq2SHcd4b0OcoBOvWM
         3hYL93P/HIN94qL9lwUvUC5EkzVD/PRGBVNzmk9ednVd+fxpxY4wdyYivid1PyYPuR/U
         KkvmryC9htmaxcQkhC7Z5wj+PycuqCkkBhTg8wlkegLM9BKUZbGxxiOAeLS/Slj03CW7
         kfgNpCvh5LL/du8svsYwsDWWot+MJSqiMqNUbx4EnApPLuFlFacpkDj3CP8OGcXutRx6
         WbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792783947; x=1793388747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQ0ZY845r5Du+UUOa8gVSKQGxBME1IJCKr0CS/df4CI=;
        b=rlFU3KC0N4rEa7SCRpd8LKX3wpbB9Y4FgNezjnRr89PUq/Ub7Yk13EdrkKK8rOKdu+
         Hn88PCrDoKbw7X9ZyA+YN9hIKrjxbrG498ZoMncjdoe/eXnzJ3YiqVrotM/mU0qNgmsk
         V4lLX1CDczmE9/iyk4i3ztQE3advlT7zhV54/8JGbr4YjDgtx3qh5KTDNITKrw2H5ByT
         mmCU/pD/wNUppHtnPjuNuqH7fMLdRi1c0JEGz2S1h8hBDc5I59zuZ8txG3z7eNKuH+1j
         Yrf89IarA+BdOPLXL1O3oKd3RUgiYSDW1wXkHwZLjw76QNrsy4El4JeC9PxHd/1ImXkM
         ymTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRC17i5C/3uPVHlE9vss0EqZZ2+ZHGhjyhcigUuzUjKnaYOZGP8WOpsDUkOw9egQK5vk+rMY/nzw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiSP3tnf9s1F4oxqShglj+DhmEPNN4isyb2GR1lmaqq1vams+m
	XYohfibtW6tp5hfDfj1jkJzLVEUCLB921YUbbgqmDfG8SNvW4eExie9tQbZCxf/nfA==
X-Gm-Gg: AYBFou34Nu6qrawl09eC57i9zJt8Y+NTf00/U8NUV351D5xXxOsuiCf0BXCgAGfxLhR
	tHZQ4X5eNKlhya4QSYM+rePMfoPPUn+//6Zu5WJ+cqPJWFQk58+qgtZfEsNyakIfyLzXhiHjEK3
	SmrDWsS2Ot6r5Z8pY2uMnM9Rp7DoPqNItbdsfKtdy83Jle7uQmOaGGrRreN2fnqpMxun5hM+eJY
	t2PLANcPAGq7OCjS7DEgiJf2SAdDfUMSf9y7Mw6IJNn+Qo/tBLlj/Xar9uC/8C1rLeJBKgvEbBB
	mpDSY7RWicuF4YPJSExLWCc+GW9ztYLHPjloCGefX9twCZ6IWI7y50zUWACmfgSORuNfTVL1dV2
	1Iz03t/XetHm41Cq1NNTx2P4Nco6zyU93Y2V2+Ib2HiJGspsPp9+iGtYS8xbyjFzAmgUPZjLHrb
	2MRDgi5UJ7D5Zq2XX2zegDH+vFlEL6Mgzjgv/ZnHMmgA9mUJOH/T2PHQlpxWz+Z6tHHEqywq70W
	tcfiTOYEFWo8LSS/QiBAj4WcKkTgshjYcNLuGs5RvRRtoG8YE7PuH12cyCbGXlpGk/ENrxgNrxy
	38WYwbrBOXZK4QPUtsvOfGQAyXWsvQ2xJS+0kNDVvMRZrWavXJABSCoM0MxWA0b/SDaPc4KlNDC
	E9e7DU9if/O4DJT8=
X-Received: by 2002:a05:600c:630c:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4a211c64f9emr57232995e9.4.1792783947346;
        Fri, 23 Oct 2026 12:32:27 -0700 (PDT)
Received: from ?IPV6:2003:d9:9707:8b00:3fa:3a3e:198d:ab69? (p200300d997078b0003fa3a3e198dab69.dip0.t-ipconnect.de. [2003:d9:9707:8b00:3fa:3a3e:198d:ab69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fb08d5sm14180055e9.1.2026.10.23.12.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 12:32:26 -0700 (PDT)
Message-ID: <9a3aa73c-7b62-4f1e-983d-cf22d45ad86b@colorfullife.com>
Date: Fri, 23 Oct 2026 21:32:25 +0200
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ipc/sem: remove obsolete SEMOPM fragmentation
 warning
To: Yingjie Wang <x-professor@outlook.com>,
 Andrew Morton <akpm@linux-foundation.org>, Alexey Gladkov
 <legion@kernel.org>, "Eric W . Biederman" <ebiederm@xmission.com>
Cc: Vasily Averin <vasily.averin@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Michal Hocko <mhocko@suse.com>, Alejandro Colomar <alx@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
References: <cover.1792724953.git.x-professor@outlook.com>
 <cbd5dc183943d2177e5564f6e8ec92499836c7e5.1792724953.git.x-professor@outlook.com>
Content-Language: en-US
From: Manfred Spraul <manfred@colorfullife.com>
In-Reply-To: <cbd5dc183943d2177e5564f6e8ec92499836c7e5.1792724953.git.x-professor@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Yingjie,

On 10/23/26 5:19 AM, Yingjie Wang wrote:
> The UAPI comment advises keeping SEMOPM at or below 1000 because a larger
> operation array may fail due to physical memory fragmentation.
>
> Commit e4243b8062c1 ("ipc/sem: play nicer with large nsops allocations")
> changed the operation array to kvmalloc() specifically to support larger
> configured limits, with vmalloc fallback when a physically contiguous
> allocation is unavailable.
>
> Replace the obsolete warning with a description of the compiled-in
> default and the runtime sysctl.
>
> Signed-off-by: Yingjie Wang <x-professor@outlook.com>
> ---
>   include/uapi/linux/sem.h | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/include/uapi/linux/sem.h b/include/uapi/linux/sem.h
> index 75aa3b273cd99..cfd772f4c3396 100644
> --- a/include/uapi/linux/sem.h
> +++ b/include/uapi/linux/sem.h
> @@ -71,16 +71,15 @@ struct  seminfo {
>    * The values has been chosen to be larger than necessary for any
>    * known configuration.
>    *
> - * SEMOPM should not be increased beyond 1000, otherwise there is the
> - * risk that semop()/semtimedop() fails due to kernel memory fragmentation when
> - * allocating the sop array.
> + * SEMOPM is the default maximum number of operations per semop() call. The
> + * runtime limit can be changed through /proc/sys/kernel/sem.
>    */
>   
>   
>   #define SEMMNI  32000           /* <= IPCMNI  max # of semaphore identifiers */
>   #define SEMMSL  32000           /* <= INT_MAX max num of semaphores per id */
>   #define SEMMNS  (SEMMNI*SEMMSL) /* <= INT_MAX max # of semaphores in system */
> -#define SEMOPM  500	        /* <= 1 000 max num of ops per semop call */
> +#define SEMOPM  500	        /* default max num of ops per semop call */
>   #define SEMVMX  32767           /* <= 32767 semaphore maximum value */
>   #define SEMAEM  SEMVMX          /* adjust on exit max value */
>   

I think there is a conceptual issue, but perhaps it is today not 
relevant anymore:

The values in uapi/linux/{sem,shm,msg}.h can be adapted as needed: Just 
change the values to what you need, compile a new kernel and you have a 
suitable system, even without sysctl compiled in.

Your change breaks this: SEMOPM is both the compiled in value, and the 
implied limit when _ACCOUNT is used. If someone increases SEMOPM in the 
header file - suddenly more unaccounted memory can be allocated.
Perhaps there should be two defines: SEMOPM and e.g. SEMOPM_NOACCOUNT?

SEPMOPM_NOACCOUNT defined in ipc/sem.c, perhaps 500 or 1000.

And SEMOPM remains in the uapi header file.

Minor point: So far, the format of all limits is identical. Could we 
keep this?

#define VALUE 1234 /* <= 4321, due to whatever reason */

Perhaps something like:

> -#define SEMOPM  500            /* <= 1 000 max num of ops per semop 
> call */
> +#define SEMOPM  500            /* <= INT_MAX max num of ops per semop 
> call */
>
Reviewed-By: Manfred Spraul <manfred@colorfullife.com>
--

     Manfred

