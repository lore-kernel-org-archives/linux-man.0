Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768338;
	b=FdQ1qaoHhIupDQ0x/2P1EUwWq+Cd4syXtvrvmun0dzwR5vdA54mnxYnBDsoOq7I1rJ8X
	 Yol3xUnHXxNt6o373Aq3LbZrxL4BLCHDgmfpDNlUjn6s+0uk+HifLjyvqGzOEG0AKA4CL
	 fIobklH9zyZOaR6GTgFcJIj/XwoUOWahsd+/MVte9Vw4Gf/zb1Yvfi3xIBgS/467w6KUU
	 N9aBoC2RL/I7SuMTK9yMA2xHwz7tasfSjum4KOQq6/pwZ620RV5QTu66lMBZ8AYJ832sS
	 HIq+KA+mh34AhOgTZLx5aEvggOvEtU95IlNFkLZOTwpeqMEXilH4qCr7RtE1mWCZgGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To;
	bh=/nChdOq/b/gyYFhyjIipIGWStlUHbMLmpH6JMhnlOpM=;
	b=bDd4jOpxa6UBzn0MNc3hPDZ+WC5dO2n18mCOH1bD1nleB5QzUhQTNBEfGbyrXz6X7I8t
	 uENSWK9Djvn+3PK2LCaGT/b+auYhX+3Ybkvs3ThnbhFZcIypmzRvTSh1RM7F6tf8cbVJ4
	 gf/ckyrwmmBiD+EIGAu4TmvkypNYs+NCkqSzGei5+/6uD+V5JTcMZQiPbm/IBXLc87TOK
	 DGQSOoWKK7f9FFzXcjmxIZnOqMGAFi4gmoV+K0SilnlEBY5aapAtv3la7fU/AoztR46bv
	 6SIfO8UtkBN9oXGwxydxXUr3XmCLakwm6LYRY3UxFmEgL47W5LTvECpZ5Jc9MEme+Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=colorfullife.com;
	spf=pass smtp.mailfrom=colorfullife.com;
	dkim=pass header.d=colorfullife-com.20251104.gappssmtp.com header.i=@colorfullife-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=XFQA8qEt;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CC7606A321
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 15:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1CC7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=colorfullife.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=colorfullife.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=colorfullife-com.20251104.gappssmtp.com header.i=@colorfullife-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=XFQA8qEt
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b060ec084so668077f8f.0
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 08:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20251104.gappssmtp.com; s=20251104; t=1792768336; x=1793373136; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/nChdOq/b/gyYFhyjIipIGWStlUHbMLmpH6JMhnlOpM=;
        b=XFQA8qEt8ByaOAUvLyzpvHxIa/ul77IfVhjb2qRrhv6hPJfnctOAaGmlbxG2CB0PCa
         fUfkOOTjioqvqox19/Nmul6Q9oh+UoeJ1SsS+FeG7p4HrlUINaHpNFbQ8uTdLJg4Hxmr
         +YRJNwDcT1cysDyftwq3afmdfTgF3Xi9cu9EGFob1/kLFHg9FkwiSPVqm6R6XfUacYDm
         37lLFxo3296LMftonjo60A6SFn6/XD5Hsy2gkf7L7YrqkTnZwNoRksCyAcAEo/Tq0ba2
         ezDx7sXqT5r5STLAtGXSU30mQPSV+Tt2YBkDr8ZUsW8dZzqxsgzrDyV4LnNK69cvB3fb
         ivtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768336; x=1793373136;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/nChdOq/b/gyYFhyjIipIGWStlUHbMLmpH6JMhnlOpM=;
        b=u/mn2Ka//45dpgGdt3hyWgB6advQfKgzyoVVCyA9e3awYwJMYJGM1irvJGt3jCpJRy
         5Yj/hfK3Vj3BpKSh7Zu1ZDe19SaeaQCAxvekzRuTte7X4TfNjnLUJ/BXXTuqlpnTH7ek
         y7Nkii+otD6wTcMp09Y1tJFl1KGdh13M7ll45XSM+d94Ak5eqaXwLI5CNX22vpSVfZi3
         yqiy/D2jxy0A3O1rBhnPqMrvZrf0BOKwaivObNyeiPFZL3RV7ZsaRLuuLBb86pOU8kB9
         4P22bAI2EciAlUrArsPLXdO6cO+ntwfCqmM77wU0yHE8yNvN6/HPF4WGmV6zaD4XAbVi
         mRmw==
X-Forwarded-Encrypted: i=1; AKwUvBx2qh5+RDfAPmYQWYl9co84O8eUIKFNkYsybGGOf9q1u1YLt8X9A+CAAFBGgXvovLcVslECIQzNoZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFYIuqr2scmZHCdU+MVTW9j1rsJCnoiFoKIBDYWkNODRX41xj+
	PJ8/9ltGdwm3EAJmQXe42MZNG5R0mQqxa9rw3SULfjrIVKpTefcOb/+8LebLD842ig==
X-Gm-Gg: AYBFou0BgX6xuPMdcinWqIy/WrtHiYAxtAsLa8jHLayw6vfqL43PBgS4Y0U76lbO3ba
	UOOETuFngUgNr9BU6oLZPoILBHNoExC1JNKGKbTxUlimHknnRIx5aMTWv5bhDDdJ8HAPr6dqkgv
	UKy4HerdcQlovApEoXEDa9GB2h0alEdphbnpqvvazcaUD47eiy9810eVMjEEAYpIxhRDQXNeh7x
	qHakejndNlnBQxd8mHDv2JwuQna/NLox8l9a11Rn9Rr5zGqhDEaHANd2yseNfibJ8BegCwc9rQF
	3j9gS0RWyZFtnEhLEaV9N0uC+9OlZyiKaMlvFjQCT5FZEPfvBJkWxWmw7FoI81SiHQKNYKt15xA
	6J0alcnjFv46PPSRYAFerSLc5bVhSt1mM+iIAJI2dzWKdJa+CiTXb9VX15pwHItFmOEojtNIOu7
	8eYCBHfXkvlWpdXEzjI60rKO0CLoPm0UBQZCzR/XACTJcyE6+4xPSUfHlWzjWsEvFsR+F8dPcrw
	3avOdNpqO7+aah8TOd3CVASN+0vcR/RBCw4fy2iB2TKWAm4CJiTY453Sj04+nrzMTr+yHtntwKD
	F9uMKDzREAg5rNo9hQiuVkWhGsyB4RJnGbqqcHtG3e9d1BPsbf1vF824DZanZLaJPttwN2/BZEF
	cDP2he18710GOgvo=
X-Received: by 2002:adf:f308:0:b0:48d:b650:69aa with SMTP id ffacd0b85a97d-48e387ea74emr3047183f8f.50.1792768335827;
        Fri, 23 Oct 2026 08:12:15 -0700 (PDT)
Received: from ?IPV6:2003:d9:9707:8b00:3fa:3a3e:198d:ab69? (p200300d997078b0003fa3a3e198dab69.dip0.t-ipconnect.de. [2003:d9:9707:8b00:3fa:3a3e:198d:ab69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d40e830sm347543f8f.35.2026.10.23.08.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 08:12:14 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------lWpYfqxAIT1R3O0UqvedLtQH"
Message-ID: <24afe3f2-8cf3-4182-a5ba-951e3b574f12@colorfullife.com>
Date: Fri, 23 Oct 2026 17:12:11 +0200
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
Subject: Re: [PATCH v2 2/3] ipc/sem: reject negative SEMOPM values
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
 "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <cover.1792724953.git.x-professor@outlook.com>
 <4fc7f5cb6bea186c5266415fcadb7e26c7738a85.1792724953.git.x-professor@outlook.com>
Content-Language: en-US
From: Manfred Spraul <manfred@colorfullife.com>
In-Reply-To: <4fc7f5cb6bea186c5266415fcadb7e26c7738a85.1792724953.git.x-professor@outlook.com>

This is a multi-part message in MIME format.
--------------lWpYfqxAIT1R3O0UqvedLtQH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yingjie,

On 10/23/26 5:19 AM, Yingjie Wang wrote:
>   
> diff --git a/ipc/ipc_sysctl.c b/ipc/ipc_sysctl.c
> index d038d944257f6..2a542f838a530 100644
> --- a/ipc/ipc_sysctl.c
> +++ b/ipc/ipc_sysctl.c
[...]
> +
> +	if (sem_ctls[2] < 0) {
> +		ret = -ERANGE;
> +		goto out_unlock;
> +	}
> +
> +	ret = sem_check_semmni(sem_ctls[3]);
> +	if (ret)
> +		goto out_unlock;
> +

The mixture of an inline sem_check_semmni() function and inline logic 
for semopm looks strange.

I would remove sem_check_semmni().


Reviewed-By: Manfred Spraul <manfred@colorfullife.com>


--------------lWpYfqxAIT1R3O0UqvedLtQH
Content-Type: text/plain; charset=UTF-8; name="all-inline.txt"
Content-Disposition: attachment; filename="all-inline.txt"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2lwYy9pcGNfc3lzY3RsLmMgYi9pcGMvaXBjX3N5c2N0bC5jCmluZGV4
IDJhNTQyZjgzOGE1My4uNmJmYzY4ZjA0MzUzIDEwMDY0NAotLS0gYS9pcGMvaXBjX3N5c2N0
bC5jCisrKyBiL2lwYy9pcGNfc3lzY3RsLmMKQEAgLTcyLDE1ICs3MiwxNyBAQCBzdGF0aWMg
aW50IHByb2NfaXBjX3NlbV9kb2ludHZlYyhjb25zdCBzdHJ1Y3QgY3RsX3RhYmxlICp0YWJs
ZSwgaW50IHdyaXRlLAogCWlmIChyZXQpCiAJCWdvdG8gb3V0X3VubG9jazsKIAotCWlmIChz
ZW1fY3Rsc1syXSA8IDApIHsKLQkJcmV0ID0gLUVSQU5HRTsKKwlyZXQgPSAtRVJBTkdFOwor
CS8vIENoZWNrIHNlbW9wbSByYW5nZSBbMCwgSU5UX01BWF0KKwlpZiAoc2VtX2N0bHNbMl0g
PCAwKQogCQlnb3RvIG91dF91bmxvY2s7Ci0JfQogCi0JcmV0ID0gc2VtX2NoZWNrX3NlbW1u
aShzZW1fY3Rsc1szXSk7Ci0JaWYgKHJldCkKKwkvLyBDaGVjayBzZW1tbmkgcmFuZ2UgWzAs
IGlwY19tbmldCisJaWYgKHNlbV9jdGxzWzNdIDwgMCB8fCBzZW1fY3Rsc1szXSA+IGlwY19t
bmkpCiAJCWdvdG8gb3V0X3VubG9jazsKIAorCS8vIFRoZSB2YWx1ZXMgYXJlIHZhbGlkLiBB
cHBseSB0aGUgY2hhbmdlcy4KKwlyZXQ9MDsKIAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0la
RShzZW1fY3Rscyk7IGkrKykKIAkJV1JJVEVfT05DRShucy0+c2VtX2N0bHNbaV0sIHNlbV9j
dGxzW2ldKTsKIApkaWZmIC0tZ2l0IGEvaXBjL3V0aWwuaCBiL2lwYy91dGlsLmgKaW5kZXgg
YjE0OGI1ZTE1ZmM2Li41MWI0ZWZhM2Q2ZGIgMTAwNjQ0Ci0tLSBhL2lwYy91dGlsLmgKKysr
IGIvaXBjL3V0aWwuaApAQCAtMjQ1LDE0ICsyNDUsNiBAQCBpbnQgaXBjZ2V0KHN0cnVjdCBp
cGNfbmFtZXNwYWNlICpucywgc3RydWN0IGlwY19pZHMgKmlkcywKIHZvaWQgZnJlZV9pcGNz
KHN0cnVjdCBpcGNfbmFtZXNwYWNlICpucywgc3RydWN0IGlwY19pZHMgKmlkcywKIAkJdm9p
ZCAoKmZyZWUpKHN0cnVjdCBpcGNfbmFtZXNwYWNlICosIHN0cnVjdCBrZXJuX2lwY19wZXJt
ICopKTsKIAotc3RhdGljIGlubGluZSBpbnQgc2VtX2NoZWNrX3NlbW1uaShpbnQgc2VtbW5p
KQotewotCS8qCi0JICogQ2hlY2sgc2VtbW5pIHJhbmdlIFswLCBpcGNfbW5pXQotCSAqLwot
CXJldHVybiBzZW1tbmkgPCAwIHx8IHNlbW1uaSA+IGlwY19tbmkgPyAtRVJBTkdFIDogMDsK
LX0KLQogI2lmZGVmIENPTkZJR19DT01QQVQKICNpbmNsdWRlIDxsaW51eC9jb21wYXQuaD4K
IHN0cnVjdCBjb21wYXRfaXBjX3Blcm0gewo=

--------------lWpYfqxAIT1R3O0UqvedLtQH--
