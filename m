X-Greylist: delayed 1203 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 30 Nov 2023 14:50:46 PST
Received: from 9.mo548.mail-out.ovh.net (9.mo548.mail-out.ovh.net [46.105.48.137])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF7F194
	for <linux-man@vger.kernel.org>; Thu, 30 Nov 2023 14:50:46 -0800 (PST)
Received: from mxplan6.mail.ovh.net (unknown [10.108.1.250])
	by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4501F20584;
	Thu, 30 Nov 2023 22:13:03 +0000 (UTC)
Received: from jwilk.net (37.59.142.109) by DAG4EX1.mxp6.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 30 Nov
 2023 23:13:02 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-109S003044215fd-2458-48b6-b939-86979da7b74b,
                    37D3812BCA6D87C94946FD64308F71709B7C725B) smtp.auth=jwilk@jwilk.net
X-OVh-ClientIp: 31.175.208.160
Date: Thu, 30 Nov 2023 23:13:01 +0100
From: Jakub Wilk <jwilk@jwilk.net>
To: Alejandro Colomar <alx@kernel.org>
CC: Florian Weimer <fweimer@redhat.com>, <libc-help@sourceware.org>,
	<linux-man@vger.kernel.org>, Iker Pedrosa <ipedrosa@redhat.com>,
	<~hallyn/shadow@lists.sr.ht>, Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Re: strtol(3) setting of errno
Message-ID: <20231130221301.nteiaukktf6om6un@jwilk.net>
References: <ZWhUR9AqoSLKeT46@debian>
 <87cyvrv4bl.fsf@oldenburg.str.redhat.com>
 <ZWiCsBkRpOLEc1Y3@debian>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZWiCsBkRpOLEc1Y3@debian>
X-ClientProxiedBy: DAG5EX2.mxp6.local (172.16.2.42) To DAG4EX1.mxp6.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d05c00b4-96a0-466f-bbc0-1d5b63209747
X-Ovh-Tracer-Id: 643733272058713961
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeijedgudehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjihesthdtredttddtvdenucfhrhhomheplfgrkhhusgcuhghilhhkuceojhifihhlkhesjhifihhlkhdrnhgvtheqnecuggftrfgrthhtvghrnhepuedttdetlefhffduvdehgfefudejledtkeehudevkeekleefudeuvdegjedufffgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdelpdefuddrudejhedrvddtkedrudeitdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjfihilhhksehjfihilhhkrdhnvghtqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegrlhigsehkvghrnhgvlhdrohhrghdpfhifvghimhgvrhesrhgvughhrghtrdgtohhmpdhlihgstgdqhhgvlhhpsehsohhurhgtvgifrghrvgdrohhrghdplhhinhhugidqmhgrnhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpihhpvggurhhoshgrsehrvgguhhgrthdrtghomhdpmihhrghllhihnhdsshhhrgguohifsehlihhsthhsrdhsrhdrhhhtpdhmthhkrdhmrghnphgrghgvshesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhohe
 egkedpmhhouggvpehsmhhtphhouhht

* Alejandro Colomar <alx@kernel.org>, 2023-11-30 13:40:
>Since POSIX doesn't specify, I assume it allows setting errno on 
>success, as with any other libc function.  That includes setting errno 
>on a successful call that returns 0.

No? "These functions shall not change the setting of errno if 
successful."

-- 
Jakub Wilk
