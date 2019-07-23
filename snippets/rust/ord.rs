impl Ord for T {
    fn cmp(&self, rhs: &Self) -> Ordering {
    }
}

impl PartialOrd for T {
    fn partial_cmp(&self, rhs: &Self) -> Option<Ordering> {
        Some(self.cmp(rhs))
    }
}

impl PartialEq for T {
    fn eq(&self, rhs: &Self) -> bool {
    }
}
