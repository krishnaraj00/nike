import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/splash.dart';

class CheckoutFlowScreen extends StatefulWidget {
  const CheckoutFlowScreen({super.key});
  @override
  State<CheckoutFlowScreen> createState() => _CheckoutFlowScreenState();
}

class _CheckoutFlowScreenState extends State<CheckoutFlowScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _goNext() {
    if (_current < 2) {
      setState(() {
        _current++;
        _tabController.animateTo(_current);
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _addressTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Full Name (Required)*',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            hintText: 'Phone number (Required)*',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                '+Add Alternate Phone Number',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(width: 60),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Pincode (Required)*',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'State (Required)*',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: 'City (Required)*',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: 'Landmark (Required)*',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: 'House No., Building Name (Required)*',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: 'Road name, Area, Colony (Required)*',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Type of address',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.home_outlined, color: Colors.black),
              label: const Text('Home', style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(width: 8),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.work_outline, color: Colors.black),
              label: const Text('Work', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: _goNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Save',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _summaryTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery to:',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'John Smith',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 8),
            TextButton.icon(
              onPressed: () {
                /* home tapped */
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.grey[300],
                minimumSize: Size(0, 32),
                padding: EdgeInsets.symmetric(horizontal: 8),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              icon: Icon(Icons.home, size: 16, color: Colors.black54),
              label: Text(
                'Home',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Text(
          'Quisque fermentum ipsum vitae diam sagittis malesuada. Ut rutrum venenatis sem, non molestie leo vehicula a.',
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
        const SizedBox(height: 16),
        Container(
          height: 190,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/image/shoe1.png',
                width: 160,
                height: 190,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Men’s Road Racing Shoes\nWhite/Black/University Red – 6 (EU 40)',
                  style: GoogleFonts.poppins(fontSize: 13),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
            children: [
              Text(
                'Qty',
                style: TextStyle(fontSize: 14, color: Colors.grey[800]),
              ),
              SizedBox(width: 8),
              InkWell(
                onTap: () {
                  // open dropdown
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                        color: Colors.grey[600],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),
        Text(
          'Price Details',
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: GoogleFonts.poppins()),
            Text('₹ 23,795.00', style: GoogleFonts.poppins()),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Delivery', style: GoogleFonts.poppins()),
            Text('₹ 1,250.00', style: GoogleFonts.poppins()),
          ],
        ),
        const SizedBox(height: 8),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            Text(
              '₹ 25,045.00',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: _goNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Continue',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _paymentTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Text('Payment', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 12),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(4),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Men’s Road Racing Shoes',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text(
                '6 (EU 40)',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('Subtotal'),
                  SizedBox(width: 200),
                  Text('23795.00'),
                ],
              ),
              Row(
                children: [
                  Text('Delivery'),
                  SizedBox(width: 212),
                  Text('1250.00'),
                ],
              ),
              SizedBox(height: 10),
              Divider(),
              // _priceRow('Total', 25045.00, isBold: true),
              Text(
                'Total                                                     25045.00',
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _payOption(Icons.payment, 'UPI', selected: true),
            _payOption(Icons.credit_card, 'Card'),
            _payOption(Icons.account_balance, 'Bank'),
            _payOption(Icons.money, 'Cash'),
          ],
        ),
        const SizedBox(height: 16),
        // _payMethodTile('Paypal'),
        // _payMethodTile('Gpay'),
        // _payMethodTile('Paytm'),
        // _payMethodTile('PhonePe'),
        _payMethodsSection(),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                // MaterialPageRoute(builder: (context) =>  OrderSuccessPage()),ordersplashPage
                MaterialPageRoute(builder: (context) => OrderSplash()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Place Order',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _payOption(IconData icon, String label, {bool selected = false}) {
    return GestureDetector(
      onTap: () {
        // handle tap if needed
      },
      child: Container(
        width: 84,
        height: 104,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 1,
              offset: Offset(0, 2), // bottom-only shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: selected ? Colors.white : Colors.grey),
            SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: selected ? Colors.white : Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  //

  Widget _payMethodsSection() {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 1,
            offset: Offset(0, 1), // bottom-only shadow
          ),
        ],
      ),
      child: Column(
        children: [
          _staticMethodTile(
            'Paypal',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyrVL2zliblKBvfftqIxrH8EQJTypVfkOUbg&s',
            true,
          ),
          const SizedBox(height: 10),
          _staticMethodTile(
            'Gpay',
            'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/google-pay-icon.png',
            false,
          ),
          const SizedBox(height: 10),
          _staticMethodTile(
            'Paytm',
            'https://play-lh.googleusercontent.com/IWU8HM1uQuW8wVrp6XpyOOJXvb_1tDPUDAOfkrl83RZPG9Ww3dCY9X1AV6T1atSvgXc',
            false,
          ),
          const SizedBox(height: 10),
          _staticMethodTile(
            'PhonePe',
            'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/phonepe-icon.png',
            false,
          ),
        ],
      ),
    );
  }

  Widget _staticMethodTile(String name, String url, bool selected) {
    return ListTile(
      leading: Image.network(url, width: 41, height: 41, fit: BoxFit.contain),
      title: Text(name, style: GoogleFonts.poppins(fontSize: 15)),
      trailing: Radio<String>(
        value: name,
        groupValue: selected ? name : '',
        activeColor: Colors.black,
        onChanged: null, // disabled
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: _current,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
          title: Text(
            _current == 0
                ? 'Address'
                : _current == 1
                ? 'Order Summary'
                : 'Payment',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.location_on_outlined), text: 'Address'),
              Tab(
                icon: Icon(Icons.receipt_long_outlined),
                text: 'Order Summary',
              ),
              Tab(icon: Icon(Icons.payment_outlined), text: 'Payment'),
            ],
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [_addressTab(), _summaryTab(), _paymentTab()],
        ),
      ),
    );
  }
}
